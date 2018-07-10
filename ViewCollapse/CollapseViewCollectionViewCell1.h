//
//  CollapseViewCollectionViewCell.h
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollapseViewCollectionViewCell1 : UICollectionViewCell
@property BOOL isSelected;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UILabel *lbl11;
@property (weak, nonatomic) IBOutlet UILabel *lbl21;
@property (weak, nonatomic) IBOutlet UILabel *lbl31;
@property (weak, nonatomic) IBOutlet UILabel *lbl41;
@property (weak, nonatomic) IBOutlet UIImageView *image1;


@end
