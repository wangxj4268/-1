//
//  OneCell.m
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "OneCell.h"
@interface OneCell(){
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_descLabel;
    
}
@end
@implementation OneCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    KWS(ws);
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageView=[[UIImageView alloc]init];
        [ws.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView).offset(20);
            make.left.equalTo(ws.contentView).offset(10);
            make.bottom.equalTo(ws.contentView).offset(-20);
            make.width.mas_equalTo(@60);
        }];
        _imageView.layer.cornerRadius=8;
        _imageView.layer.masksToBounds=YES;
      
        _titleLabel=[[UILabel alloc]init];
        [ws.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.contentView).offset(10);
            make.left.equalTo(_imageView.mas_right).offset(5);
            make.right.equalTo(ws.contentView).offset(-10);
        }];
        _titleLabel.font=[UIFont systemFontOfSize:15];

        
        _descLabel=[[UILabel alloc]init];
        [ws.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(20);
            make.left.equalTo(_titleLabel);
            make.right.equalTo(ws.contentView).offset(-10);
            make.bottom.equalTo(ws.contentView).offset(-10);
        }];
        _descLabel.font=[UIFont systemFontOfSize:11];
        _descLabel.numberOfLines=0;
    }
    return self;
}
-(void)setModel:(OneModel *)model{
    _model=model;
    NSString *urlString=[NSString stringWithFormat:WOneImageUrl,model.image];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"ne3.jpg"]];
    _titleLabel.text=model.title;
    _descLabel.text=model.summary;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
