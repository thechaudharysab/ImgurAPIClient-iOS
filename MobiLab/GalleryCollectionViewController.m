//
//  GalleryCollectionViewController.m
//  MobiLab
//
//  Created by Chaudhary Talha on 4/21/16.
//  Copyright © 2016 Chaudhary Talha. All rights reserved.
//

#import "GalleryCollectionViewController.h"
#import "UIImageView+WebCache.h"
#import "ImageDetailViewController.h"
#import "KGModal.h"


@interface GalleryCollectionViewController ()
{
    UIActivityIndicatorView *activityView;
}

@end

@implementation GalleryCollectionViewController 

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"Images are: %@",self.recievedImages);
    
   
    //[iac galleryAlbum:result[1]];
    
       // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"Count is: %lu",(unsigned long)self.recievedImages.count);
        return self.recievedImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
    //recipeImageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    if ([self.recievedImages count]!=0) {
        //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.recievedImages objectAtIndex:indexPath.row]]]];
        
        NSURL *galleryURL = [NSURL URLWithString:[self.recievedImages objectAtIndex:indexPath.row]];
        
        [imageView sd_setImageWithURL:galleryURL placeholderImage:[UIImage imageNamed:@"gallery"]];
        if ([[self.recievedTitles objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
            titleLabel.text = @"No Title Found";
        }
        else
        {
        titleLabel.text = [NSString stringWithFormat:@"%@",[self.recievedTitles objectAtIndex:indexPath.row]];
        }
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Images" message:@"Sorry, There are no images found. Go back and try again." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    
    ImageDetailViewController *idvc = (ImageDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"DetailView"];

    idvc.imageURL = [NSString stringWithFormat:@"%@",[self.recievedImages objectAtIndex:indexPath.row]];
    
    if ([[self.recievedTitles objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
        idvc.titleText = @"No Title Found";}
    else
    {
    idvc.titleText = [NSString stringWithFormat:@"%@",[self.recievedTitles objectAtIndex:indexPath.row]];
    }
    
    if ([[self.recievedDesc objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
        idvc.descText = @"No Description Found";
    }
    else{
    idvc.descText = [NSString stringWithFormat:@"%@",[self.recievedDesc objectAtIndex:indexPath.row]];
    }
    
    if ([[self.recievedUps objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
        idvc.totalUps = @"Total Up: 0";}
    else
    {
    idvc.totalUps = [NSString stringWithFormat:@"%@",[self.recievedUps objectAtIndex:indexPath.row]];
    }
    
    if ([[self.recievedDowns objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
        idvc.totalDowns = @"Total Down: 0";
    }
    else
    {   idvc.totalDowns = [NSString stringWithFormat:@"%@",[self.recievedDowns objectAtIndex:indexPath.row]];
    }
    
    if ([[self.recievedScore objectAtIndex:indexPath.row] isEqual:[NSNull null]]) {
        idvc.totalScore = @"Total Score: 0";}
    else
    {   idvc.totalScore = [NSString stringWithFormat:@"%@",[self.recievedScore objectAtIndex:indexPath.row]];
    }
    
    idvc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width-100, self.view.bounds.size.height-100);
    [[KGModal sharedInstance] setCloseButtonType:KGModalCloseButtonTypeRight];
    [[KGModal sharedInstance] showWithContentView:idvc.view andAnimated:YES];
    
    //[self.navigationController pushViewController:idvc animated:YES];
    
}

@end
