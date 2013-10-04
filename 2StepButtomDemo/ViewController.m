//
//  ViewController.m
//  2StepButtomDemo
//
//  Created by Fernando Bass on 9/11/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import "ViewController.h"
#import "FB2StepButton.h"

@interface ViewController () <FB2StepButtonDelegate, UITableViewDataSource,UITableViewDelegate>
{
    NSArray *fruits;
    NSArray *cars;
    NSMutableArray *dinamicSections;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    fruits = @[@"Apple",@"Banana", @"Pineapple", @"Orange", @"Lemon", @"Kiwi"];
    cars = @[@"Ferrari", @"Bugatti", @"Honda", @"Lamborguini"];
    
    dinamicSections = [NSMutableArray array];
    
    [dinamicSections addObject:fruits];
    [dinamicSections addObject:cars];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dinamicSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dinamicSections objectAtIndex:section] count];
}


#pragma mark UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.textLabel.text = [[dinamicSections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    viewHeader.backgroundColor = [UIColor colorWithRed:0.247 green:0.294 blue:0.241 alpha:1.000];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 320, 30)];
    title.text = [NSString stringWithFormat:@"Title Header %d", section];
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    
    FB2StepButton *buttom = [[FB2StepButton alloc] initWithDelegate:self position:CGPointMake(295, 5)];
    buttom.slide = FB2StepButtonSlideLeft;
    buttom.tag = section;

    [viewHeader addSubview:buttom];
    [viewHeader addSubview:title];
    
    return viewHeader;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark FB2StepButtonDelegate

- (void)clickedButtonWithAction:(FB2StepButtonStep)step sender:(id)sender
{
    FB2StepButton *b = (FB2StepButton*)sender;
    if (step == FBButtonActionClear) {
        [self.tableView beginUpdates];
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:b.tag] withRowAnimation:UITableViewRowAnimationFade];
        [dinamicSections removeObjectAtIndex:b.tag];
        [self.tableView endUpdates];
        
        NSIndexSet *indexes = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(0, dinamicSections.count)];
        [self.tableView reloadSections:indexes withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
