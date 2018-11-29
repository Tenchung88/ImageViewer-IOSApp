//
//  ImageSearch.h
//  imageScroller
//
//  Created by user144335 on 10/2/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageSearchDelegate;

@interface ImageSearch : NSObject
@property (nonatomic)id<ImageSearchDelegate>delegate; //creating the object to delegate the work back to Viewcontroller
-(void) imageLookUpWithName:(NSString*) nameOfImage; //method to look for image and fetch it from server
@end

@protocol  ImageSearchDelegate
-(void) imageSearchDidFinishWithData : (NSData *) data;
@end
NS_ASSUME_NONNULL_END
