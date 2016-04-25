//
//  ImageDetailViewController.m
//  MobiLab
//
//  Created by Chaudhary Talha on 4/25/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "KGModal.h"

@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController

@synthesize myImg;
@synthesize mydescription;
@synthesize titleLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@",self.titleText];
    self.mydescription.text = [NSString stringWithFormat:@"%@",self.descText];
    self.upVotesLabel.text = [NSString stringWithFormat:@"%@",self.totalUps];
    self.downVotesLabel.text = [NSString stringWithFormat:@"%@",self.totalDowns];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@",self.totalScore];
    
    self.myImg.userInteractionEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
