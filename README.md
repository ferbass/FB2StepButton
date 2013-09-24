2StepButton is inspired on button as which appears at Notification Center on iOS 6



!['image 1'](https://dl.dropboxusercontent.com/u/4586579/2stepbutton/1.PNG) &nbsp; !['image 2'](https://dl.dropboxusercontent.com/u/4586579/2stepbutton/2.PNG)


!['image 3'](https://dl.dropboxusercontent.com/u/4586579/2stepbutton/3.PNG) &nbsp; !['image 4'](https://dl.dropboxusercontent.com/u/4586579/2stepbutton/4.PNG)


## How to use

* Add QuartzCore framework in your application.

* import FB2StepButton

```objective-c
#import "FB2StepButton.h"
```

* set a delegate for FB2StepButton

```objective-c
@interface ViewController () <FB2StepButtonDelegate>
```

* basic implementation of button on view

```objective-c
    FB2StepButton *fbButtonRight = [[FB2StepButton alloc] initWithDelegate:self position:CGPointMake(295, 5)];
    fbButtonRight.slide = FB2StepButtonSlideLeft;
    [self.view addSubview:fbButtonRight];
```

* implemente a delegate

```objective-c
#pragma mark FB2StepButtonDelegate
- (void)clickedButtonWithAction:(FB2StepButtonStep)step
{
    NSLog(@"%d", step);
    //do anything
}
```

### Frameworks dependency

* QuartzCore

## License

This project is under the MIT license (details in COPYRIGHT.txt). Do whatever you want with it and contributions of any form are very welcome.
