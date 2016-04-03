//
//  MyHeadView.m
//  QQ列表
//
//  Created by lxx on 16/2/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
            self.frame=CGRectMake(0, 0, 640, 44);

        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:self.bounds];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIImage *image=[UIImage imageNamed:@"disclosure"];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        self.button=btn;
        
    }
    return self;

}
-(void)BtnClick
{

    [self.delegate didClickHeadView:self];
}
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    self.frame=CGRectMake(0, 0, self.bounds.size.width, 44);
//    self.button.frame=self.bounds;
//}
-(void)setIsOpen:(BOOL)isOpen
{
    _isOpen=isOpen;
 
    CGFloat angle=isOpen ? M_PI_2 : 0;
    [UIView animateWithDuration:0.1f animations:^{
        [self.button.imageView setTransform:CGAffineTransformMakeRotation(angle)];
    }];

}
@end
