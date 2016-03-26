//
//  CollectCell.m
//  十日美文
//
//  Created by qianfeng on 16/3/21.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "CollectCell.h"
@interface CollectCell(){
    UILabel *_titleLabel;
    UIImageView *_imageView;
    UIButton *_closeBtn;
}
@end

@implementation CollectCell
- (void)awakeFromNib {
    self.isEdit=NO;
}

-(void)setIsEdit:(BOOL)isEdit{
    _isEdit=isEdit;
    _closeBtn.hidden=!isEdit;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        KWS(ws);
        _imageView=[[UIImageView alloc]init];
        [ws.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView).offset(10);
            make.left.equalTo(ws.contentView).offset(10);
            make.width.mas_equalTo(KWidth/2-40);
            make.bottom.equalTo(ws.contentView).offset(-60);
        }];
        
        _titleLabel=[[UILabel alloc]init];
        [ws.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_bottom).offset(5);
            make.left.equalTo(ws.contentView).offset(10);
            make.right.equalTo(ws.contentView).offset(-10);
            make.bottom.equalTo(ws.contentView.mas_bottom).offset(-5);
        }];
        
        _closeBtn=[UIButton buttonWithType:UIButtonTypeSystem];
        [ws.contentView addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView).offset(5);
            make.left.equalTo(ws.contentView).offset(5);
            make.height.width.mas_equalTo(@25);
        }];
        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"close@2x"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)setModel:(Entity *)model{
    _model=model;
    if ([model.imageUrl isEqualToString:@"2"]) {
        _imageView.image=[UIImage imageNamed:@"ne3.jpg"];
    }
    else{
        NSString *str=[NSString stringWithFormat:WOneImageUrl,model.imageUrl];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"ne3.png"]];
    }
    
    _imageView.layer.cornerRadius=8;
    _imageView.layer.masksToBounds=YES;
    
    _titleLabel.text=model.title;
    _titleLabel.font=[UIFont systemFontOfSize:14];
    _titleLabel.numberOfLines=0;
}
- (void)close:(id)sender {
    if ([_delegate respondsToSelector:@selector(deleteWithModel:)]) {
        [_delegate deleteWithModel:_model];
    }
}
@end
