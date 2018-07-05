//
//  KeystoreManager.swift
//  TestDemo
//
//  Created by HF on 2018/6/22.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

import TrustCore
//import TrustKeystore

@objc public class KeystoreManager:NSObject {
    var address:String
    public override init() {
        
        address = ""
        
        super.init()
        print("Creating keystore ")//加密
//        let privateKey = Data(hexString: "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266")!
//        let key = try! KeystoreKey(password: "password", key: privateKey)
//        let json = try! JSONEncoder().encode(key)
       
        print("Decrypting keystore")//解密
        //let decrypted = try! key.decrypt(password: "password")
        
       // self.testCreateWallet()
        
       

        
    }
    
    public func privateKeyData(hexString: String) throws -> Data {
        return Data(hexString: hexString)!
    }
    
    public func walletList() {
        let key = try! KeyStore();
        print(key.keysByAddress.keys)
    }
    public func testCreateWallet()  {
       
        let keyStore = try! KeyStore();
        let password = "password"
        //创建新账户
        let newAccount = try! keyStore.createAccount(password: password, type: .hierarchicalDeterministicWallet)
        //以太坊的地址：（以太坊钱包的地址/地址）以0x开头的42位的哈希值(16进制)字符串
        let address = newAccount.address
        //明文私钥   ：64位的16机制哈希字符串
        let privateKey = try! keyStore.exportPrivateKey(account: newAccount, password: password)
        //keystore
        print(address,privateKey.hexString);
        
        let jsonData = try! keyStore.export(account: newAccount, password: password, newPassword: password)
        print(jsonData) //存储
        
        let decoder = JSONDecoder()
        let keystorekey = try! decoder.decode(KeystoreKey.self, from: jsonData)

       var privateKey33 = try! keystorekey.decrypt(password: password)
       defer {
            privateKey33.resetBytes(in: 0..<privateKey33.count)
       }
       print(privateKey33.hexString)
        
        
//        let account2 = try! keyStore.import(json: jsonData, password: password, newPassword: password)
//        let  privateKey2 = try! keyStore.exportPrivateKey(account: account2, password: password)
//        let decoder = JSONDecoder()
//        let keystorekey = try! decoder.decode(KeystoreKey.self, from: jsonData)
//        let  privateKey3 = Wallet(mnemonic: memories, passphrase: keystorekey.passphrase, path: keystorekey.derivationPath).getKey(at: 0).privateKey

        //39000fb861fa6f02dadd788d288767c31234a67065fc830e5cc24b2f2ea6d772
        //print( privateKey3.hexString);
        
        //
        let key = try! JSONDecoder().decode(KeystoreKey.self, from:jsonData)
        //print(key.address.eip55String)
        

        
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(key)
        print(String(data: data, encoding: .utf8)!)//显示在界面上
    }
    
    //根据私钥 获取 公钥 和 地址
    public func testGetAddress()  {
        let password = "password"
        
        let keyStore = try! KeyStore();
        let pubData = Data(hexString: "0x52F3Fe770592EADe976693504c102832340f93C2")
       // let keystoreKey = keyStore.keysByAddress[Address(data: pubData!)]
        let account = keyStore.account(for: Address(data: pubData!))
        let privateKey = try! keyStore.exportPrivateKey(account: account!, password: password)
        print(privateKey.hexString)//d347cf3831bb800630e5e90c7a52a1c7cf33713b240000d32820b05ddd38e490
        
        /*
        let privateKeyData = Data(hexString: "4769e7cf57ee792b21c064df6d8595951db3aae8165061b91239d57db98b7fe1")!
        let pubKey = EthereumCrypto.getPublicKey(from: privateKeyData)
        
        let address = KeystoreKey.decodeAddress(from: pubKey)
        let account : Account = keyStore.account(for: address)!
        //以太坊的地址：（以太坊钱包的地址/地址）以0x开头的42位的哈希值(16进制)字符串
        let walletAddress = account.address
        print(walletAddress.eip55String)
        
        //导出助记词
        let memories = try! keyStore.exportMnemonic(account: account, password: password)
        print(memories)
        //地址 0x35c8D038E686eE263c871Ff307f0DC417B6c946d
        //公钥 04e5bb1f6f5d3900a967959fd41c90c6cef56bda766650b6e83b76bc0091d7e4abc4041fd8b4df7bbc62c12ce6a70d0a6f0cd642925be72a5ed8461a506d1e9c7b
 */
    }
    
    //导出 keystore:encrypted JSON key
    public func testExportJson () {
        let password = "password"
        
        let keyStore = try! KeyStore();
        let pubData = Data(hexString: "0x52F3Fe770592EADe976693504c102832340f93C2")
        let account = keyStore.account(for: Address(data: pubData!))
        let jsonData = try! keyStore.export(account: account!, password: password, newPassword: password)
        print(jsonData) //存储
        let key = try! JSONDecoder().decode(KeystoreKey.self, from:jsonData)
        //print(key.address.eip55String)
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(key)
        print(String(data: data, encoding: .utf8)!)//显示在界面上
    }
    
    public func text() -> String {
        let password = "password"
        
        let keyStore = try! KeyStore();
        let pubData = Data(hexString: "0x17d2e6B1fF567005Cc48e1c379922cF8C9553e83")
       
        let account = keyStore.account(for: Address(data: pubData!))
        let jsonData = try! keyStore.export(account: account!, password: password, newPassword: password)
//        let newAccount:Account = try! keyStore.import(json: jsonData, password: password, newPassword: password)
        return (account!.address.eip55String);
    }
    
    public func callBackBlock11 (){
        log("Creating keystore ")
        let privateKey = Data(hexString: "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266")!
        let key = try! KeystoreKey(password: "password", key: privateKey)
        log("Decrypting keystore")
        let decrypted = try! key.decrypt(password: "password")
        print(decrypted.hexString)
        log("Finished")
    }
    public func callBackBlock(block: (_ str: String, _ int2: Int) -> Void) {
        
        
        block("XXXXXXX",2)
    }
    
    func log(_ message: String) {
        print(message)
    }
}
