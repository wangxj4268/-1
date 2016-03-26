//
//  TwoCell.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "TwoCell.h"
@interface TwoCell (){
    UILabel *_titleLabel;
    UILabel *_descLabel;
}
@end
@implementation TwoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    KWS(ws);
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel=[[UILabel alloc]init];
        [ws.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView).offset(10);
            make.left.equalTo(ws.contentView).offset(20);
            make.right.equalTo(ws.contentView).offset(-5);
            make.height.mas_equalTo(@20);
        }];
        
        _descLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, 345, 40)];
        [ws.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(20);
            make.left.equalTo(ws.contentView).offset(20);
            make.right.equalTo(ws.contentView).offset(-5);
            make.bottom.equalTo(ws.contentView).offset(-5);
        }];
    }
    return self;
}

-(void)setModel:(TwoModel *)model{
    _model=model;
    _titleLabel.text=model.title;
    _descLabel.text=model.summary;
    _descLabel.font=[UIFont systemFontOfSize:14];
    _descLabel.numberOfLines=0;
    _descLabel.textColor=[UIColor grayColor];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
