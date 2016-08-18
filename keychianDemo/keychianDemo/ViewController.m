//
//  ViewController.m
//  keychianDemo
//
//  Created by 李朝 on 16/8/18.
//  Copyright © 2016年 HSMDT. All rights reserved.
//

#import "ViewController.h"

#import "KeychainItemWrapper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

/** 保存用户账号的KeychainItemWrapper */
@property (strong, nonatomic) KeychainItemWrapper *wrapper;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击登录按钮
#pragma mark -

- (IBAction)login:(id)sender {
    
    [self.wrapper setObject:self.accountTextField.text forKey:(__bridge id)kSecAttrAccount];
    [self.wrapper setObject:self.passwordTextField.text forKey:(__bridge id)kSecValueData];
    
    
    
}


- (IBAction)clearLocationPassword:(id)sender {
    [self.wrapper resetKeychainItem];
}

- (IBAction)getAccountAndPassword:(id)sender {
    NSString *account = [self.wrapper objectForKey:(__bridge id)kSecAttrAccount];
    NSString *password = [self.wrapper objectForKey:(__bridge id)kSecValueData];
    NSLog(@"%@--%@", account, password);
}

#pragma mark - 懒加载
#pragma mark -


/**
 * wrapper
 */
- (KeychainItemWrapper *)wrapper
{
    if (_wrapper == nil) {
        
        _wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"userAccount" accessGroup:nil];
    }
    return _wrapper;
}



@end
