//
//  CollapseViewCollectionViewCell.h
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollapseViewCollectionViewCell : UICollectionViewCell
@property BOOL isSelected;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl3;
@property (weak, nonatomic) IBOutlet UILabel *lbl4;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end
