//
//  ThreeCell.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "ThreeCell.h"
@interface ThreeCell(){
    UIImageView *_imageView;
    UILabel *_label;
}
@end
@implementation ThreeCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        KWS(ws);
        _imageView=[[UIImageView alloc]init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView);
            make.left.equalTo(ws.contentView);
            make.width.mas_equalTo((KWidth-30)/2);
            make.height.mas_equalTo((KHeight-64-49-80)/2);
        }];
        
        _label=[[UILabel alloc]init];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_bottom).offset(0);
            make.left.equalTo(ws.contentView);
            make.right.equalTo(ws.contentView);
            make.bottom.equalTo(ws.contentView).offset(0);
        }];
    }
    return self;
}

-(void)setModel:(ThreeModel *)model{
    _model=model;    
    NSString *urlString=[NSString stringWithFormat:WThreeImageUrl,model.image];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"ne5.png"]];
    
    _label.text=model.title;
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font=[UIFont systemFontOfSize:15];
    _label.numberOfLines=0;
}
@end
