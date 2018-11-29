//
//  ViewController.m
//  imageScroller
//
//  Created by user144335 on 10/1/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "ViewController.h"
#import "ImageSearch.h"

@interface ViewController ()<ImageSearchDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (nonatomic) ImageSearch *imgSearch;
@property (nonatomic) NSArray *nameOfImages;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController

int i = 0; //global variable to keep track of the image number which is displayed
-(NSArray*) nameOfImages{  //getter for initializing the array with image names
    if(_nameOfImages == nil)
    {
        _nameOfImages = [NSArray arrayWithObjects:@"lobster.jpg",@"pasta.png",@"pizza.jpg",@"steak.jpg", nil];
    }
    return _nameOfImages;
}
- (IBAction)nextClicked { //action to perform when NEXT button is clicked
    
    if(i<self.nameOfImages.count-1)
    {
    i=i+1;
        [self.myActivityIndicator startAnimating]; //start the animation for activity indicator
    [self.imgSearch imageLookUpWithName:[self.nameOfImages objectAtIndex:i]]; //calling the lookUp method with image name
       
    }
    else{ // else part to again set the global variable "i" and to start the loop again when the user clicks on NEXT upon reaching the last image
       i = 0;
        [self.myActivityIndicator startAnimating];
        [self.imgSearch imageLookUpWithName:[self.nameOfImages objectAtIndex:0]];
    }
}

- (IBAction)previousClicked { //action to perform when PREVIOUS button is clicked
    if(i>0){
        i=i-1;
        [self.myActivityIndicator startAnimating]; //starting the animation
        [self.imgSearch imageLookUpWithName:[self.nameOfImages objectAtIndex:i]]; //calling the loopUp methos with image name
    }
    else{
        i=3;
        [self.myActivityIndicator startAnimating];
        [self.imgSearch imageLookUpWithName:[self.nameOfImages objectAtIndex:i]];
    }
}


-(ImageSearch*) imgSearch{ //object initialization in getter to attain the lazy loading
    if(_imgSearch == nil)
    {
        _imgSearch = [[ImageSearch alloc]init];
        _imgSearch.delegate = self; //assigning the value to delegate
    }
    return _imgSearch;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imgSearch imageLookUpWithName:[self.nameOfImages objectAtIndex:i]];  //lookup method call to display the first image when the viewcontroller is loaded
}
-(void) imageSearchDidFinishWithData : (NSData *) data{ //delegate method implementation
    dispatch_async(dispatch_get_main_queue(), ^{ //calling the main queue to update the image view UI component
        self.myImageView.image = [UIImage imageWithData:data];
        [self.myActivityIndicator stopAnimating];  // stop the animation for activity indicator after the image is passed to image view
    });
}

@end
