//
//  CollapseViewCollectionViewCell.m
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import "CollapseViewCollectionViewCell1.h"
#define kDefaultAnimationDuration 0.33

@implementation CollapseViewCollectionViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes{
    if (self.isSelected) {
        //-- OPEN
        [UIView animateWithDuration:kDefaultAnimationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self layoutIfNeeded];
                             self.arrow1.transform = CGAffineTransformMakeRotation(M_PI);
                             self.lbl21.alpha = 1.0f;
                             self.lbl31.alpha = 1.0f;
                             self.lbl41.alpha = 1.0f;
                             self.image1.alpha = 1.0f;
                             
                             
                         } completion:nil];
        
    }else{
        //-- CLOSE
        [UIView animateWithDuration:kDefaultAnimationDuration
                         animations:^{
                             [self layoutIfNeeded];
                             self.arrow1.transform = CGAffineTransformIdentity;
                             self.lbl21.alpha = 0.0f;
                             self.lbl31.alpha = 0.0f;
                             self.lbl41.alpha = 0.0f;
                             self.image1.alpha = 0.0f;
                         }];
    }
}

@end
