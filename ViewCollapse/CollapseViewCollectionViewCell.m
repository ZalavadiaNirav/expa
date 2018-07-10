//
//  CollapseViewCollectionViewCell.m
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import "CollapseViewCollectionViewCell.h"
#define kDefaultAnimationDuration 0.33

@implementation CollapseViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes{
//    if (self.isSelected) {
//        //-- OPEN
//        [UIView animateWithDuration:kDefaultAnimationDuration
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseInOut
//                         animations:^{
//                             [self layoutIfNeeded];
//                             self.arrow.transform = CGAffineTransformMakeRotation(M_PI);
//                             self.lbl2.alpha = 1.0f;
//                             self.lbl3.alpha = 1.0f;
//                             self.lbl4.alpha = 1.0f;
//                             self.image.alpha = 1.0f;
//
//
//                         } completion:nil];
//
//    }else{
//        //-- CLOSE
//        [UIView animateWithDuration:kDefaultAnimationDuration
//                         animations:^{
//                             [self layoutIfNeeded];
//                             self.arrow.transform = CGAffineTransformIdentity;
//                             self.lbl2.alpha = 0.0f;
//                             self.lbl3.alpha = 0.0f;
//                             self.lbl4.alpha = 0.0f;
//                             self.image.alpha = 0.0f;
//                         }];
//    }
//}

@end
