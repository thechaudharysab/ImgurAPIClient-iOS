//
//  ImageDetailViewController.h
//  MobiLab
//
//  Created by Chaudhary Talha on 4/25/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *mydescription;
@property (strong, nonatomic) IBOutlet UILabel *upVotesLabel;
@property (strong, nonatomic) IBOutlet UILabel *downVotesLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;


@property (strong, nonatomic) IBOutlet UIImageView *myImg;


@property (strong, nonnull) NSString *imageURL;
@property (strong, nonnull) NSString *titleText;
@property (strong, nonnull) NSString *descText;
@property (strong, nonnull) NSString *totalUps;
@property (strong, nonnull) NSString *totalDowns;
@property (strong, nonnull) NSString *totalScore;


@end
