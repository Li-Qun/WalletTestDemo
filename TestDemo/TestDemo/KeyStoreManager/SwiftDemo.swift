//
//  SwiftDemo.swift
//  TestDemo
//
//  Created by HF on 2018/6/22.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

import Foundation
@objc(SwiftDemo)

public class SwiftDemo : NSObject {
    
    public func logMe() {
        print("log me");
    }
    
    public func swiftStaticFunc(log: NSString) {
        print(log);
    }
    
}
