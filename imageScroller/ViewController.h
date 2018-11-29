//
//  ViewController.h
//  imageScroller
//
//  Created by user144335 on 10/1/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)nextClicked;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicator;//for indicator view
@end

