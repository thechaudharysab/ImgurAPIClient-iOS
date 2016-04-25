//
//  ImgurAPIClient.m
//  MobiLab
//
//  Created by Chaudhary Talha on 4/21/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import "ImgurAPIClient.h"


@implementation ImgurAPIClient

- (id)initWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret{

    return [self initWithBaseURL:[NSURL URLWithString:@"https://api.imgur.com/"] clientId:clientId clientSecret:clientSecret];
}

- (id)initWithBaseURL:(NSURL *)url clientId:(NSString *)clientId clientSecret:(NSString *)clientSecret{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self.requestSerializer setValue:[@"Client-ID " stringByAppendingString:clientId] forHTTPHeaderField:@"Authorization"];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.clientId = clientId;
    self.clientSecret = clientSecret;
    return self;
}

- (void)gallerySection:(NSString*)section sort:(NSString*)sort page:(NSString*)page showViral:(NSString*)showViral {
 
    [self GET:[NSString stringWithFormat:@"%@3/gallery/%@/%@/%@.json?showViral=%@", self.baseURL,section,sort,page,showViral] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Success 1");
        self.dataDict = (NSDictionary *)responseObject;
        
        dataArr = [[NSMutableArray alloc] init];
        dataArr = [self.dataDict valueForKey:@"data"];

        typeArr = [[NSMutableArray alloc] init];
        linkArr = [[NSMutableArray alloc] init];

        typeArr = [dataArr valueForKey:@"type"];
        linkArr = [dataArr valueForKey:@"link"];

        [self sortGallryIDs];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failed #1");

    }];
}

- (void)gallerySectionWindow:(NSString*)section sort:(NSString*)sort page:(NSString*)page window:(NSString *)window showViral:(NSString*)showViral {
    
    //3/gallery/{section}/{sort}/{window}/{page}?showViral=bool
    
    [self GET:[NSString stringWithFormat:@"%@3/gallery/%@/%@/%@/%@?showViral=%@", self.baseURL,section,sort,window,page,showViral] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Success 1");
        self.dataDict = (NSDictionary *)responseObject;
        
        dataArr = [[NSMutableArray alloc] init];
        dataArr = [self.dataDict valueForKey:@"data"];
        
        typeArr = [[NSMutableArray alloc] init];
        linkArr = [[NSMutableArray alloc] init];
        
        typeArr = [dataArr valueForKey:@"type"];
        linkArr = [dataArr valueForKey:@"link"];
        
        [self sortGallryIDs];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failed #1");
        
    }];
}


- (void)sortGallryIDs {
    
    galleryIDsArr = [[NSMutableArray alloc] init];
    
    for (int i=0; i<linkArr.count; i++) {
        if ([[typeArr objectAtIndex:i] isEqual:[NSNull null]]) {
            [galleryIDsArr addObject:[[linkArr objectAtIndex:i] stringByReplacingOccurrencesOfString:@"http://imgur.com/a/" withString:@""]];
        }
    }
    NSLog(@"Success 2");
    [self galleryAlbum:[galleryIDsArr objectAtIndex:0]];
    
}

- (void)galleryAlbum:(NSString *)ID {
    
    NSLog(@"ID is %@", ID);
    
    [self GET:[NSString stringWithFormat:@"%@3/gallery/album/%@", self.baseURL,ID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Success 3");
        
        self.galleryData = (NSDictionary *)responseObject;
        
        galleryDataArr = [[NSMutableArray alloc] init];
        galleryDataArr = [self.galleryData valueForKey:@"data"];
        
        galleryImagesArr = [[NSMutableArray alloc] init];
        galleryImagesArr = [galleryDataArr valueForKey:@"images"];
        
        titleArr = [[NSMutableArray alloc] init];
        descArr = [[NSMutableArray alloc] init];
        galleryImgLinkArr = [[NSMutableArray alloc] init];
        ups = [[NSMutableArray alloc] init];
        downs = [[NSMutableArray alloc] init];
        score = [[NSMutableArray alloc] init];

        titleArr = [galleryImagesArr valueForKey:@"title"];
        descArr = [galleryImagesArr valueForKey:@"description"];
        
        galleryImgLinkArr = [galleryImagesArr valueForKey:@"link"];
        
        ups = [galleryImagesArr valueForKey:@"ups"];
        downs = [galleryImagesArr valueForKey:@"downs"];
        score = [galleryImagesArr valueForKey:@"score"];
        
//        ViewController *vc = [[ViewController alloc] init];
//        [vc finalArray:galleryImgLinkArr];
        
        [self.delegate finalImageURLs:galleryImgLinkArr titleIs:titleArr descriptionIs:descArr upVote:ups downVote:downs scoreIs:score];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failed #2");
        
    }];

    
}

@end
