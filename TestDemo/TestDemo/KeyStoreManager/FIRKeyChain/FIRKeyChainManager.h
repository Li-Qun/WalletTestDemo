//
//  FIRKeyChainManager.h
//  AkeyWallet
//
//  Created by HF on 2018/6/23.
//  Copyright © 2018年 Fir.im. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FIRKeyChainManager : NSObject

+ (instancetype)shareEngine;

+ (void)loadConfigurations;

//增加和更新
- (void)saveWalletObject:(id)obj key:(NSString *)key;

//删除
- (void)removeWalletObjectWithKey:(NSString *)key;

//读取全部key
- (NSArray *)getAllKeys;

//读取
- (NSData *)getJsonDataWithKey:(NSString *)key;

@end
