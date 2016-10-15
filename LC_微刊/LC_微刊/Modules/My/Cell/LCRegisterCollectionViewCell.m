//
//  LCRegisterCollectionViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCRegisterCollectionViewCell.h"
#import "LCMacro.h"

@implementation LCRegisterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.02, SCREEN_WIDTH * 0.8, SCREEN_WIDTH * 0.1)];
        phoneTextField.backgroundColor = [UIColor whiteColor];
        phoneTextField.textColor = [UIColor lightGrayColor];
        phoneTextField.placeholder = @"请输入手机号";
        phoneTextField.font = [UIFont systemFontOfSize:15];
        [self addSubview:phoneTextField];
        
        UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.08, SCREEN_WIDTH * 0.8, 1)];
        phoneLabel.backgroundColor = [UIColor lightGrayColor];
        phoneLabel.alpha = 0.6;
        [self addSubview:phoneLabel];
        
        
        
        UITextField *codeTextField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.11, SCREEN_WIDTH * 0.6, SCREEN_WIDTH * 0.1)];
        codeTextField.backgroundColor = [UIColor whiteColor];
        codeTextField.textColor = [UIColor lightGrayColor];
        codeTextField.placeholder = @"请输入验证码";
        codeTextField.font = [UIFont systemFontOfSize:15];
        [self addSubview:codeTextField];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.7, SCREEN_HEIGHT * 0.12, 1, SCREEN_WIDTH * 0.08)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.alpha = 0.6;
        [self addSubview:label];
        
        UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        codeButton.frame = CGRectMake(SCREEN_WIDTH * 0.7 + 1, SCREEN_HEIGHT * 0.11, SCREEN_WIDTH * 0.2 - 1, SCREEN_WIDTH * 0.1);
        [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [codeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        codeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        codeButton.alpha = 0.6;
        [self addSubview:codeButton];
        
        UILabel *codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.17, SCREEN_WIDTH * 0.8, 1)];
        codeLabel.backgroundColor = [UIColor lightGrayColor];
        codeLabel.alpha = 0.6;
        [self addSubview:codeLabel];
        
        
        UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.2, SCREEN_WIDTH * 0.8, SCREEN_WIDTH * 0.1)];
        passwordTextField.backgroundColor = [UIColor whiteColor];
        passwordTextField.textColor = [UIColor lightGrayColor];
        passwordTextField.placeholder = @"请输入密码";
        passwordTextField.secureTextEntry = YES;
        passwordTextField.font = [UIFont systemFontOfSize:15];
        [self addSubview:passwordTextField];
        
        UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.26, SCREEN_WIDTH * 0.8, 1)];
        passwordLabel.backgroundColor = [UIColor lightGrayColor];
        passwordLabel.alpha = 0.6;
        [self addSubview:passwordLabel];
        
        
        
        UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        signInButton.frame = CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.3, SCREEN_WIDTH * 0.8, SCREEN_WIDTH * 0.1);
        signInButton.backgroundColor = [UIColor lightGrayColor];
        signInButton.alpha = 0.4;
        signInButton.layer.cornerRadius = 3.0f;
        [signInButton setTitle:@"登 录" forState:UIControlStateNormal];
        [self addSubview:signInButton];
        
        
        UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        forgetButton.frame = CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_HEIGHT * 0.36, SCREEN_WIDTH * 0.6, SCREEN_WIDTH * 0.06);
        [forgetButton setTitle:@"点击注册即代表同意《用户协议》" forState:UIControlStateNormal];
        forgetButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [forgetButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self addSubview:forgetButton];
        

    }
    return self;
}

@end
