//
//  ViewController.m
//  MobiLab
//
//  Created by Chaudhary Talha on 4/20/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"
#import "ImgurAPIClient.h"
#import "GalleryCollectionViewController.h"

@interface ViewController ()
{
    ImgurAPIClient *iac;
    NSString *section;
    NSString *sort;
    NSString *window;
    NSString *view;
    NSString *parameterType;
    NSString *viral;
    
    UIActivityIndicatorView *activityView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    iac = [[ImgurAPIClient alloc] initWithClientId:@"60548c78cdf6b9e" clientSecret:@"1bd2c9ec82ae25e80f2854388ad9421d9adcbe60"];
    iac.delegate = self;
}

-(void)finalImageURLs:(NSMutableArray*)array titleIs:(NSMutableArray*)title descriptionIs:(NSMutableArray*)desc upVote:(NSMutableArray*)ups downVote:(NSMutableArray*)downs scoreIs:(NSMutableArray*)score{

    [activityView stopAnimating];
    
    GalleryCollectionViewController *cvc = (GalleryCollectionViewController *)[self.storyboard
                                                                               instantiateViewControllerWithIdentifier: @"GalleryView"];
    
    cvc.recievedImages = array;
    cvc.recievedUps = ups;
    cvc.recievedDesc = desc;
    cvc.recievedDowns = downs;
    cvc.recievedTitles = title;
    cvc.recievedScore =score;
    
    [self.navigationController pushViewController:cvc animated:YES];
}

-(void)callAPIClient
{
    if ([parameterType isEqualToString:@"sort"]) {
        [iac gallerySection:section sort:sort page:@"0" showViral:viral];
    }
    else
    {
        [iac gallerySectionWindow:section sort:sort page:@"0" window:window showViral:viral];
    }
}



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"GalleryView"]) {
        NSLog(@"Segue Blocked");
        
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)viewGalleryPressed:(id)sender {
    
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
   
    
    switch (self.galleryType.selectedSegmentIndex)
    {
        case 0: section = @"hot";
            break;
        case 1: section = @"top";
            break;
        case 2: section = @"user";
            break;
        default: section = @"top";
            break;
    }
    switch (self.sortType.selectedSegmentIndex) {
        case 0:
            sort = @"viral";
            break;
        case 1:
            sort = @"top";
            break;
        case 2:
            sort = @"time";
            break;
        default:
            break;
    }
    switch (self.windowType.selectedSegmentIndex) {
        case 0:
            window = @"day";
            break;
        case 1:
            window = @"week";
            break;
        case 2:
            window = @"month";
            break;
        case 3:
            window = @"year";
            break;
        case 4:
            window = @"all";
            break;
        default:
            window = @"all";
            break;
    }
    switch (self.galleryView.selectedSegmentIndex)
    {
        case 0: view = @"list";
            break;
        case 1: view = @"grid";
            break;
        case 2: view = @"staggered";
            break;
        default: view = @"grid";
            break;
    }
    switch (self.parameters.selectedSegmentIndex)
    {
        case 0: parameterType = @"sort";
            break;
        case 1: parameterType = @"window";
            break;
        default:
            parameterType = @"sort";
            break;
    }
    switch (self.showViral.selectedSegmentIndex)
    {
        case 0: viral = @"true";
            break;
        case 1: viral = @"false";
            break;
        default: viral = @"true";
            break;
    }
    
    [self callAPIClient];
    
   
}

- (IBAction)sectionAction:(id)sender {
    
    if (self.galleryType.selectedSegmentIndex==1&&self.parameters.selectedSegmentIndex==1) {
        self.windowType.hidden = false;
        self.windowLabel.hidden = false;
    }
    else
    {
        self.windowType.hidden = true;
        self.windowLabel.hidden = true;
    }


}

- (IBAction)paraAction:(id)sender {
    if (self.galleryType.selectedSegmentIndex==1&&self.parameters.selectedSegmentIndex==1) {
        self.windowType.hidden = false;
        self.windowLabel.hidden = false;
    }
    else
    {
        self.windowType.hidden = true;
        self.windowLabel.hidden = true;
    }
}
@end
