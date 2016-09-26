//
//  HYAdvertisingView.m
//  HYApp_base
//
//  Created by work on 16/9/22.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYAdvertisingView.h"

static NSInteger const adTime = 5;  // 广告显示时间

@interface HYAdvertisingView()

@property (strong, nonatomic) UIImageView *adImageView;
@property (strong, nonatomic) UIButton *skipBtn;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;

@end
@implementation HYAdvertisingView
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self initLayout];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.adImageView];
    [self addSubview:self.skipBtn];
}

- (void)initLayout {
    kWeakSelf(self);
    
    // 广告图片
    [self.adImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.top.equalTo(weakself.mas_top);
        make.right.equalTo(weakself.mas_right);
        make.bottom.equalTo(weakself.mas_bottom);
    }];
    
    // 跳过按钮
    [self.skipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).offset(24);
        make.right.equalTo(weakself.mas_right).offset(-5);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
}

#pragma mark - public methods
- (void)show {
    [self startTimer];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

#pragma mark - button events
/**
 打开广告页面
 */
- (void)openAdWebView {
    [self dismiss];
    
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:DISPATCH_AD_PAGE object:nil userInfo:nil];
}

- (void)clickedSkipBtnHandler {
}

- (void)countDown {
    self.count --;
    [self.skipBtn setTitle:[NSString stringWithFormat:@"跳过%ld", self.count] forState:UIControlStateNormal];
    if (self.count == 0) {
        [self dismiss];
    }
}

#pragma mark - private methods
- (void)startTimer {
    self.count = adTime;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)dismiss {
    [self.timer invalidate];
    self.count = 0;
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - setter and getter
- (UIImageView *)adImageView {
    if (_adImageView) {
        _adImageView = [UIImageView new];
        _adImageView.userInteractionEnabled = YES;
        _adImageView.contentMode = UIViewContentModeScaleAspectFill;
        _adImageView.clipsToBounds = YES;
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAdWebView)];
        [_adImageView addGestureRecognizer:tapGR];
    }
    return _adImageView;
}

- (UIButton *)skipBtn {
    if (!_skipBtn) {
        _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_skipBtn setTitle:[NSString stringWithFormat:@"跳过%ld", adTime] forState:UIControlStateNormal];
        _skipBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _skipBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];;
        _skipBtn.layer.cornerRadius = 4;
        [_skipBtn addTarget:self action:@selector(clickedSkipBtnHandler) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipBtn;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (NSInteger)count {
    if (!_count) {
        _count = 0;
    }
    return _count;
}

- (void)setImageFieldPath:(NSString *)imageFieldPath {
    _imageFieldPath = imageFieldPath;
    self.adImageView.image = [UIImage imageWithContentsOfFile:imageFieldPath];
}

@end

