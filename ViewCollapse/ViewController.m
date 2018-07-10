//
//  ViewController.m
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import "ViewController.h"
#import "CollapseViewCollectionViewCell.h"
#import "CollapseViewCollectionViewCell1.h"

#define CollapsedHeight 80.0f
#define ExpandedHeight  415.0f


@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *expandableArr;
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property BOOL collapseOpened;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    expandableArr=[NSMutableArray new];
    for (int i=0; i<2; i++)
    {
        [expandableArr insertObject:@false atIndex:i];
        
    }
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollapseViewCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB"];
    
     [self.collectionView registerNib:[UINib nibWithNibName:@"CollapseViewCollectionViewCell1" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB1"];
    
    self.collapseOpened = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            CollapseViewCollectionViewCell *collapse = (CollapseViewCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB" forIndexPath:indexPath];
            return collapse;
        }
        case 1:
        {
            CollapseViewCollectionViewCell1 *collapse1 = (CollapseViewCollectionViewCell1 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB1" forIndexPath:indexPath];
            return collapse1;
        }
            break;
            
            
        case 2:
        {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
            UIButton *submitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
            [submitBtn addTarget:self action:@selector(submiteAction) forControlEvents:UIControlEventTouchUpInside];
            [submitBtn setFrame:CGRectMake(100, 0, 100, 40)];
            [submitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [cell addSubview:submitBtn];
            [cell layoutIfNeeded];
            return cell;
        }
            break;
    }
    return [[UICollectionViewCell alloc] init];
}

-(void)submiteAction
{
    NSLog(@"submite");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        switch (indexPath.row) {
            case 0:
            {
                self.collapseOpened = ![[expandableArr objectAtIndex:0] boolValue];
                
                [UIView animateWithDuration:0.30
                                      delay:0.0f
                                    options:UIViewAnimationOptionCurveEaseInOut
                                 animations:^{
                                     [self.view layoutIfNeeded];
                                 } completion:nil];
                
                CollapseViewCollectionViewCell *collapse = (CollapseViewCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
                if(self.collapseOpened==true)
                {
                    collapse.isSelected = YES;
                    [self expandCell:collapse.isSelected :collapse];
                }
                else
                {
                    collapse.isSelected = NO;
                    [self expandCell:collapse.isSelected :collapse];
                }
                [expandableArr replaceObjectAtIndex:0 withObject:[NSNumber numberWithBool:self.collapseOpened]];
                   [expandableArr replaceObjectAtIndex:1 withObject:[NSNumber numberWithBool:(!self.collapseOpened)]];
                [collectionView performBatchUpdates:nil completion:nil];
            }
            break;
            case 1:
            {
                self.collapseOpened = !([[expandableArr objectAtIndex:1] boolValue]);
                
                [UIView animateWithDuration:0.30
                                      delay:0.0f
                                    options:UIViewAnimationOptionCurveEaseInOut
                                 animations:^{
                                     [self.view layoutIfNeeded];
                                 } completion:nil];
                
                CollapseViewCollectionViewCell1 *collapse1 = (CollapseViewCollectionViewCell1*)[self.collectionView cellForItemAtIndexPath:indexPath];
                if(self.collapseOpened==true)
                {
                    collapse1.isSelected = true;
                    
                    [self expandCell1:collapse1.isSelected :collapse1];
                }
                else
                {
                    collapse1.isSelected = false;
                    [self expandCell1:collapse1.isSelected :collapse1];
                }
                [expandableArr replaceObjectAtIndex:0 withObject:[NSNumber numberWithBool:(!self.collapseOpened)]];
                [expandableArr replaceObjectAtIndex:1 withObject:[NSNumber numberWithBool:self.collapseOpened]];
                [collectionView performBatchUpdates:nil completion:nil];
            }
                break;
            default:
                break;
        }
    
}

- (void)expandCell:(BOOL)isSelected:(CollapseViewCollectionViewCell *)cell
{
    if (isSelected) {
        //-- OPEN
        [UIView animateWithDuration:0.33
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [cell layoutIfNeeded];
                             cell.arrow.transform = CGAffineTransformMakeRotation(M_PI);
                             cell.lbl2.alpha = 1.0f;
                             cell.lbl3.alpha = 1.0f;
                             cell.lbl4.alpha = 1.0f;
                             cell.image.alpha = 1.0f;
                             
                         } completion:nil];
        
    }else{
        //-- CLOSE
        [UIView animateWithDuration:0.33
                         animations:^{
                             [cell layoutIfNeeded];
                             cell.arrow.transform = CGAffineTransformIdentity;
                             cell.lbl2.alpha = 0.0f;
                             cell.lbl3.alpha = 0.0f;
                             cell.lbl4.alpha = 0.0f;
                             cell.image.alpha = 0.0f;
                         }];
    }
}

- (void)expandCell1:(BOOL)isSelected:(CollapseViewCollectionViewCell1 *)cell
{
    if (isSelected) {
        //-- OPEN
        [UIView animateWithDuration:0.33
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [cell layoutIfNeeded];
                             cell.arrow1.transform = CGAffineTransformMakeRotation(M_PI);
                             cell.lbl21.alpha = 1.0f;
                             cell.lbl31.alpha = 1.0f;
                             cell.lbl41.alpha = 1.0f;
                             cell.image1.alpha = 1.0f;
                             
                         } completion:nil];
        
    }else{
        //-- CLOSE
        [UIView animateWithDuration:0.33
                         animations:^{
                             [cell layoutIfNeeded];
                             cell.arrow1.transform = CGAffineTransformIdentity;
                             cell.lbl21.alpha = 0.0f;
                             cell.lbl31.alpha = 0.0f;
                             cell.lbl41.alpha = 0.0f;
                             cell.image1.alpha = 0.0f;
                         }];
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.frame.size.width;

    if([expandableArr count]>0)
    {
        switch (indexPath.row) {
            case 0:
            {
                CGFloat h = [[expandableArr objectAtIndex:0] boolValue] ? ExpandedHeight : CollapsedHeight;
                return CGSizeMake(width, h);
            }
                break;
            case 1:
            {
                CGFloat h = [[expandableArr objectAtIndex:1] boolValue] ? ExpandedHeight : CollapsedHeight;
                return CGSizeMake(width, h);
            }
                break;
            default:
                return CGSizeMake(width, 80);
                break;
        }
    }
       return CGSizeMake(width, 80);
}
//    if(([expandableArr count]>0) && ([[expandableArr objectAtIndex:indexPath.row] boolValue]==true) && (indexPath.row<2))
//    {
//        CGFloat h = [[expandableArr objectAtIndex:indexPath.row] boolValue] ? ExpandedHeight : CollapsedHeight;
//        return CGSizeMake(width, h);
//    }
//    else
//    {
////        CGFloat h = [[expandableArr objectAtIndex:indexPath.row] boolValue] ? ExpandedHeight : CollapsedHeight;
//        return CGSizeMake(width, 80);
//    }
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

@end
