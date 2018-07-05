//
//  ViewController.m
//  TestDemo
//
//  Created by HF on 2017/10/23.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "ViewController.h"
//#import "HFMediatorManager.h"
//#import <CryptoSwift-Swift.h>
//@import CryptoSwift;
#import "TestDemo-Swift.h"

#import "UICKeyChainStore.h"//钥匙串存储
#import "FIRKeyChainManager.h"

@interface ViewController ()

@property (strong, nonatomic) void (^clickActionButtonBlock)(NSString *firstText,NSString *secondText);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [HFMediatorManager setUid:@"123"];
//     NSLog(@"%@",[HFMediatorManager uid]);
    
     //SwiftObject *object = [[SwiftObject alloc]init ];
    NSLog(@"%@",NSLocalizedString(@"click", nil));
    KeystoreManager *keystore = [[KeystoreManager alloc]init];
    [keystore callBackBlock11];
//    [keystore callBackBlockWithBlock:^(NSString * text, NSInteger num) {
//        NSLog(@"%@ %@",text,@(num));
//    }];
    
    //一个字符串返回值
    //    NSString *address = [keystore text];
    //    NSLog(@"%@",address);
    //一个闭包回调
    
//    [keystore callBackBlockWithBlock:^(NSString * _Nonnull text) {
//        NSLog(@"%@",text);
//    }];
//    [keystore textBlockWithTextFunblock:^(NSString * text) {
//        NSLog(@"%@",text);
//    }];
    
    
    
    //[keystore testCreateWallet];//导入一个秘钥json
      //[keystore text];
    
//    SwiftDemo* demo = [[SwiftDemo alloc] init];
//    [demo logMe];
//    [demo swiftStaticFuncWithLog:@"abc"];
    //钥匙串存储和读取
    //存储：
//    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"fir.im token"];
//    //keychain[@"passwordKey"] = keyData;
//    [keychain setData:keyData forKey:@"passwordKey"];
    //读取
//    UICKeyChainStore *keychainStore = [UICKeyChainStore keyChainStoreWithService:@"fir.im token"];//要跟保存时保持一致
//    NSString *passWordStr = [keychainStore stringForKey:@"passwordKey"];//要跟保存时保持一致
//    NSLog(@"%@",passWordStr);
//    //
//    [keychainStore setString:@"111" forKey:@"111"];
//    [keychainStore setString:@"222" forKey:@"222"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
