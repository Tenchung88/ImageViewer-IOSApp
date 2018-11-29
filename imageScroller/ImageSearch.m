//
//  ImageSearch.m
//  imageScroller
//
//  Created by user144335 on 10/2/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "ImageSearch.h"
@interface ImageSearch()
@end
@implementation ImageSearch

-(void) imageLookUpWithName:(NSString*) nameOfImage{ //method to make a network call with a specified URL

    NSString* urlStr = [NSString stringWithFormat:@"https://raniaarbash.000webhostapp.com/%@",nameOfImage]; //name of images stored in array and retreived as a parameter. Its essentially an API call
    
    NSURL *url = [NSURL URLWithString:urlStr]; //converting the URL string to URL object to check its valid url
    dispatch_queue_t newQueue  = dispatch_queue_create("getImageQueue",NULL); //creating the new queue to make a network call on seperate thread
    dispatch_async(newQueue,^{ //assigning the work to queue in asynchronous manner
        [NSThread sleepForTimeInterval:2]; //deliberately added the sleep interval just to check the activity indicator
            NSData *data = [[NSData alloc]initWithContentsOfURL:url]; //getting the data from the specified URL and store to data
        if(self.delegate){
            [self.delegate imageSearchDidFinishWithData:data];  //calling the delegate method with the data recieved from the URL
        }
    });
}


@end
