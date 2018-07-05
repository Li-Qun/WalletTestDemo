//
//  FIRKeyChainManager.m
//  AkeyWallet
//
//  Created by HF on 2018/6/23.
//  Copyright © 2018年 Fir.im. All rights reserved.
//

#import "FIRKeyChainManager.h"
#import "UICKeyChainStore.h"//钥匙串存储

@interface FIRKeyChainManager ()

@property (nonatomic, strong) UICKeyChainStore *keychainStore;
@property (nonatomic, strong) NSMutableDictionary *keystoreDictionary;//{address:KeystoreKey}
@end

@implementation FIRKeyChainManager

- (instancetype)init {
    self = [super init];
    if (!self)  return nil;
    return self;
}

+ (instancetype)shareEngine {
    static FIRKeyChainManager *managerEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerEngine = [[self alloc] init];
    });
    return managerEngine;
}

+ (void)loadConfigurations
{
    //加载基本配置
    [[self shareEngine] loadKeyChainStore];
}

#pragma mark - protect

#pragma mark - Private

- (void)loadKeyChainStore
{
    //该服务关键字专门用来存钱包的基本信息：地址，密钥，助记词
    self.keychainStore = [UICKeyChainStore keyChainStoreWithService:@"fir.im.wallet"];
    //钥匙串当且仅当在应用解锁情况可被访问,且不允许iTune备份
#warning 存在钥匙串的数据要求必须加密处理
    self.keychainStore.accessibility = UICKeyChainStoreAccessibilityWhenUnlockedThisDeviceOnly;
    self.keystoreDictionary = [NSMutableDictionary dictionary];
}

//增加和更新
- (void)saveWalletObject:(id)obj key:(NSString *)key
{
    if (obj && key) {
        [self.keychainStore setData:obj forKey:key];
        [self.keystoreDictionary setObject:obj forKey:key];
    } else {
        //TODO:
        NSLog(@"obj:%@_key:%@",obj,key);
    }
}

//删除
- (void)removeWalletObjectWithKey:(NSString *)key
{
    if (key) {
        NSError *error;
        [self.keychainStore removeItemForKey:key error:&error];
        [self.keystoreDictionary removeObjectForKey:key];
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }
}


//读取全部key
- (NSArray *)getAllKeys
{
    return self.keychainStore.allKeys;
}

//读取
- (NSData *)getJsonDataWithKey:(NSString *)key
{
    if (key) {
        return [self.keychainStore dataForKey:key];
    }
    return nil;
}

@end
