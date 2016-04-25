//
//  ViewController.h
//  MobiLab
//
//  Created by Chaudhary Talha on 4/20/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgurAPIClient.h"

@interface ViewController : UIViewController <apiClientDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *galleryType;
@property (strong, nonatomic) IBOutlet UISegmentedControl *galleryView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *parameters;
@property (strong, nonatomic) IBOutlet UISegmentedControl *showViral;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sortType;
@property (strong, nonatomic) IBOutlet UISegmentedControl *windowType;
@property (strong, nonatomic) IBOutlet UILabel *windowLabel;

- (IBAction)viewGalleryPressed:(id)sender;
- (IBAction)sectionAction:(id)sender;
- (IBAction)paraAction:(id)sender;

@end

