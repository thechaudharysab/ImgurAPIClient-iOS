//
//  GalleryCollectionViewController.h
//  MobiLab
//
//  Created by Chaudhary Talha on 4/21/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import <UIKit/UIKit.h>



//@class ImgurAPIClient;


@interface GalleryCollectionViewController : UICollectionViewController

@property (strong) NSMutableArray *recievedImages;
@property (strong) NSMutableArray *recievedTitles;
@property (strong) NSMutableArray *recievedDesc;
@property (strong) NSMutableArray *recievedUps;
@property (strong) NSMutableArray *recievedDowns;
@property (strong) NSMutableArray *recievedScore;

@end
