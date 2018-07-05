//
//  test.swift
//  TestDemo
//
//  Created by HF on 2018/6/21.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

import Foundation
import CryptoSwift

@objc public class SwiftObject:NSObject {
    public override init() {
        let hash = "123".md5() // "123".bytes.md5()
        print("123MD5之后==\(hash)")
        
//        let data = "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266".data(using: .utf8)
//        let text = String.init(data: data!, encoding: .utf8)
//        print(text)
//        let privateKey = Data(hexString: "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266")!
    }
}
