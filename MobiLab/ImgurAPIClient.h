//
//  ImgurAPIClient.h
//  MobiLab
//
//  Created by Chaudhary Talha on 4/21/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

    
@protocol apiClientDelegate;
@interface ImgurAPIClient : AFHTTPRequestOperationManager 
{
    NSMutableArray *dataArr;    //General Data
    NSMutableArray *typeArr;   //to fetch the type in order to figure out which is a galleray and which is an image
    NSMutableArray *linkArr;  //to fetch the links of galleries
    
    NSMutableArray *galleryIDsArr; //contains all the ID's of albums
    
    NSMutableArray *galleryDataArr;
    NSMutableArray *galleryImagesArr;   //Contains images from gallery
    NSMutableArray *titleArr;            //title of images
    NSMutableArray *descArr;            //desc of images
    NSMutableArray *galleryImgLinkArr; //Gallery Images link
    NSMutableArray *ups;
    NSMutableArray *downs;
    NSMutableArray *score;
    
}

@property (nonatomic, weak) id<apiClientDelegate> delegate;

@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *clientSecret;

@property(strong) NSDictionary *dataDict;     //Contains GLobal Data
@property(strong) NSDictionary *galleryData; //Contains data retrived from gallery images

- (id)initWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret;
- (void)gallerySection:(NSString*)section sort:(NSString*)sort page:(NSString*)page showViral:(NSString*)showViral;
- (void)gallerySectionWindow:(NSString*)section sort:(NSString*)sort page:(NSString*)page window:(NSString *)window showViral:(NSString*)showViral;
- (void)galleryAlbum:(NSString *)ID;

@end

@protocol apiClientDelegate <NSObject>

@required
-(void)finalImageURLs:(NSMutableArray*)array titleIs:(NSMutableArray*)title descriptionIs:(NSMutableArray*)desc upVote:(NSMutableArray*)ups downVote:(NSMutableArray*)downs scoreIs:(NSMutableArray*)score;

@end
