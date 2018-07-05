//
//  FirKeyStore.swift
//  TestDemo
//
//  Created by HF on 2018/6/23.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

import Foundation
import TrustCore

//管理钱包地址，密钥
public final class FirKeyStore {
    /// Dictionary of accounts by address.
    private var accountsByAddress = [Address: Account]()
    
    /// Dictionary of keys by address.
    private var keysByAddress = [Address: KeystoreKey]()

}
