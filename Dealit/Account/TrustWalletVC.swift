//
//  TrustWalletVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/03/22.
//

import Foundation
import UIKit
import WalletCore
class TrustWalletVC: UIViewController {

    
    let privateKey = "fb3bd8432ecfa80acd9a57187d48b08f68a502ee7e8cab2f7a33f6c408d6f5ae"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func createHDWallet(_ sender: Any){
        
        
//        createdemoWallet()
        p2wshWithInputWIF()
    }
    @IBAction func createAction(_ sender: Any) {

        sendBTC()

        
    }
    
    func createdemoWallet(){
        
        
        
        let wallet = HDWallet(strength: 128, passphrase: "")
        
        print(wallet?.mnemonic)
        print(wallet?.getAddressForCoin(coin: .litecoin))
        print(wallet?.getKey(coin: .litecoin
                             , derivationPath: "").data.hexString)
    }
    
    
    func testBTC(){
        
//        020000000001017b6824cd189e863c6ff5f1104a366a3503fe3a2d217830c8d970016cdcba2cb60100000000ffffffff01e81c0000000000001600146487ea38f326589ce819ea5ddf08eabadca723b70247304402200c95270728a4814fb13bb02f0cd743ef903574636abf5c530c39748b7c30445702201bde73da9e31a167ed09e275da52812b4310f5b4d030f5e5ceac6d1cc10ae27801210312c8b566a5cba16bbca13b09b1c99896dbbf4bb6caba68f02634c3b48725ecda00000000
        let utxoTxId = Data(hexString: "b62cbadc6c0170d9c83078212d3afe03356a364a10f1f56f3c869e18cd24687b")! // latest utxo for sender, "txid" field from blockbook utxo api: https://github.com/trezor/blockbook/blob/master/docs/api.md#get-utxo
        
        let wif = "cStCTxG1cZUMitKkFxyiQQDJNiMKgHp5zmhWNgbhNvCySatqft6w"
               let decoded = Base58.decode(string: wif)!
               let privateKey = PrivateKey(data: decoded[1 ..< 33])!
       
        let address = CoinType.bitcoin.deriveAddress(privateKey: privateKey)

        let utxo = BitcoinUnspentTransaction.with {
            $0.outPoint.hash = Data(utxoTxId.reversed()) // reverse of UTXO tx id, Bitcoin internal expects network byte order
            $0.outPoint.index = 1                        // outpoint index of this this UTXO, "vout" field from blockbook utxo api
            $0.outPoint.sequence = UINT32_MAX
            $0.amount = 74000                             // value of this UTXO, "value" field from blockbook utxo api
            $0.script = BitcoinScript.lockScriptForAddress(address: address, coin: .bitcoin).data // Build lock script from address or public key hash
        }
//        let utxo2 = BitcoinUnspentTransaction.with {
//            $0.outPoint.hash = Data(utxoTxId.reversed()) // reverse of UTXO tx id, Bitcoin internal expects network byte order
//            $0.outPoint.index = 1                        // outpoint index of this this UTXO, "vout" field from blockbook utxo api
//            $0.outPoint.sequence = UINT32_MAX
//            $0.amount = 1                             // value of this UTXO, "value" field from blockbook utxo api
//            $0.script = BitcoinScript.lockScriptForAddress(address: address, coin: .bitcoin).data // Build lock script from address or public key hash
//        }
        let input = BitcoinSigningInput.with {
            $0.hashType = BitcoinSigHashType.all.rawValue | BitcoinSigHashType.fork.rawValue
            $0.amount = 7400
            $0.byteFee = 1
            $0.toAddress = "tb1qvjr75w8nyevfe6qeafwa7z82htw2wgahemdu0m"
            $0.changeAddress = "tb1qx42tcdxqsdgl32jzuwt4p67y7lp2mf89zw380e" // can be same sender address
            $0.utxo = [utxo]
            $0.privateKey = [privateKey.data]
        }
       

        let output: BitcoinSigningOutput = AnySigner.sign(input: input, coin: .bitcoinCash)
        
        // encoded transaction to broadcast
        print(output.encoded.hexString)
    }
    func sendBTC(){
      
        
//        010000000001014efe0d9f03ecfc92a18ba10ca0c6274a8f7c248ff52390b92fa73d674a2e9ceb0000000000ffffffff0128230000000000001600146487ea38f326589ce819ea5ddf08eabadca723b7024730440220028a64ebff5c533be88f313b4e6eb31e8ca04287868ff650358d727b23d59c1402204145f7fa2b0d3b7826548274fa92a6c942274e5ede84c7a9505c53fae94383e101210312c8b566a5cba16bbca13b09b1c99896dbbf4bb6caba68f02634c3b48725ecda00000000
        let address = "tb1qx42tcdxqsdgl32jzuwt4p67y7lp2mf89zw380e"
               let script = BitcoinScript.lockScriptForAddress(address: address, coin: .bitcoin)
               let key = PrivateKey(data: Data(hexString: "9E302234BD295F203A92BA180B7C0E846F0E900B7076F12C15DFFD2A6A2B561E")!)!
               let pubkey = key.getPublicKeySecp256k1(compressed: true)
       
        

               

        
        
                let utxos = [
                    BitcoinUnspentTransaction.with {
                        $0.outPoint.hash = Data.reverse(hexString: "eb9c2e4a673da72fb99023f58f247c8f4a27c6a00ca18ba192fcec039f0dfe4e")
                        $0.outPoint.index = 0
                        $0.outPoint.sequence = UINT32_MAX
                        $0.script = script.data
                        $0.amount = 10000
                        
                    
                    }
                ]

                let plan = BitcoinTransactionPlan.with {
                    $0.amount = 8000
                    $0.fee = 1000
//                    $0.change = 1000
                    $0.utxos = utxos
                }

                // redeem p2wpkh nested in p2sh
                let scriptHash = script.matchPayToWitnessPublicKeyHash()!
                let input = BitcoinSigningInput.with {
                    $0.toAddress = "tb1qvjr75w8nyevfe6qeafwa7z82htw2wgahemdu0m"
//                    $0.useMaxAmount = true
                    $0.hashType = BitcoinScript.hashTypeForCoin(coinType: .bitcoin)
                    $0.coinType = CoinType.bitcoin.rawValue
                    $0.scripts = [
                        scriptHash.hexString: BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
                    ]
                    $0.privateKey = [key.data]
                    $0.plan = plan
                    
//                    $0.amount = 7000
//
//                    $0.utxo = utxos
                    
                }
                let output: BitcoinSigningOutput = AnySigner.sign(input: input, coin: .bitcoin)
        
        print(output.encoded.hexString)


    }
    
    func p2wsh(){
        // set up input
      
               
               let key = PrivateKey(data: Data(hexString: "7DA76035BD61F82C49F123F9AEB7079FC460D1937B534B8BC5D6A973BF989718")!)!
        let pubkey = key.getPublicKeySecp256k1(compressed: true)
        let address = BitcoinAddress(data: [0x0] + Hash.sha256RIPEMD(data: pubkey.data))!
        let script = BitcoinScript.lockScriptForAddress(address: address.description, coin: .bitcoin)
       
             
        let scriptHash = script.matchPayToPubkeyHash()!
               var input = BitcoinSigningInput.with {
                   $0.hashType = BitcoinScript.hashTypeForCoin(coinType: .bitcoin)
                   $0.amount = 5000
                   
                   $0.byteFee = 1
                   $0.toAddress = "tb1qvjr75w8nyevfe6qeafwa7z82htw2wgahemdu0m"
//                   $0.changeAddress =
                   $0.changeAddress = address.description
               }

        
      
     
               let utxo0 = BitcoinUnspentTransaction.with {
                   $0.script = BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
                   $0.amount = 10000
                   $0.outPoint.hash = Data.reverse(hexString: "fd5042db4fd74033a9faec454531219113a468e8b7caec854bbf245a8f778096")
                   $0.outPoint.index = 0
                   $0.outPoint.sequence = UInt32.max
               }
               input.utxo.append(utxo0)

               // Plan
               let plan: BitcoinTransactionPlan = AnySigner.plan(input: input, coin: .bitcoin)

        
        input.plan = plan
        input.scripts[scriptHash.hexString] = BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
               
        input.privateKey = [key.data]
        
               print(plan.amount)
        print(plan.fee)
        print(plan.change)

               // Extend input with private key
//               input.privateKey.append(Data(hexString: "9E302234BD295F203A92BA180B7C0E846F0E900B7076F12C15DFFD2A6A2B561E")!)
//               input.privateKey.append(Data(hexString: "619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9")!)

               // Sign
               let output: BitcoinSigningOutput = AnySigner.sign(input: input, coin: .bitcoin)
        print(output.error, TW_Common_Proto_SigningError.ok)

//               let signedTx = output.transaction
//        print(signedTx.version, 1)
//
//               let txId = output.transactionID
//        print(txId)


               let encoded = output.encoded
               
        print(encoded.hexString)
    }
    
    
    func p2wshWithInputWIF(){

        let key = PrivateKey(data: Data(hexString: "7DA76035BD61F82C49F123F9AEB7079FC460D1937B534B8BC5D6A973BF989718")!)!
 let pubkey = key.getPublicKeySecp256k1(compressed: true)
 let address = BitcoinAddress(data: [0x0] + Hash.sha256RIPEMD(data: pubkey.data))!
 let script = BitcoinScript.lockScriptForAddress(address: address.description, coin: .bitcoin)

        
        let utxos: [BitcoinUnspentTransaction] = [
                    .with {
                        $0.script = BitcoinScript.buildPayToPublicKeyHash(hash: pubkey.bitcoinKeyHash).data
                        $0.amount = 10000
                        $0.outPoint.hash = Data.reverse(hexString: "36dabf5a55a23929fa25ffa9cd32258a05798c116383214eab03c4c24c20c81c")
                        $0.outPoint.index = 0
                        $0.outPoint.sequence = UInt32.max
                    },
                    .with {
                        $0.script = BitcoinScript.buildPayToPublicKeyHash(hash: pubkey.bitcoinKeyHash).data
                        $0.amount = 10000
                        $0.outPoint.hash = Data.reverse(hexString: "43e8c47f27765673ce70d2caa1b475ca96d1abee541a6497cd08529ab8d07b28")
                        $0.outPoint.index = 0
                        $0.outPoint.sequence = UInt32.max
                    }
                ]
                 
//           let utxo2 = BitcoinUnspentTransaction.with {
//               $0.script = BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
//               $0.amount = 10000
//               $0.outPoint.hash = Data.reverse(hexString: "d45e2a9c3b4aac8c3284d521d396423ee68ff73fbf5b71b30dde0e53dc46d4e3")
//               $0.outPoint.index = 0
//               $0.outPoint.sequence = UInt32.max
//           }
//           let utxo3 = BitcoinUnspentTransaction.with {
//               $0.script = BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
//               $0.amount = 10000
//               $0.outPoint.hash = Data.reverse(hexString: "d45e2a9c3b4aac8c3284d521d396423ee68ff73fbf5b71b30dde0e53dc46d4e3")
//               $0.outPoint.index = 0
//               $0.outPoint.sequence = UInt32.max
//           }
//           let utxo4 = BitcoinUnspentTransaction.with {
//               $0.script = BitcoinScript.buildPayToWitnessPubkeyHash(hash: pubkey.bitcoinKeyHash).data
//               $0.amount = 10000
//               $0.outPoint.hash = Data.reverse(hexString: "27752ab98e9f38a498a24e3d91b3409a94dd78ff14afdddfda0641e590581db1")
//               $0.outPoint.index = 1
//               $0.outPoint.sequence = UInt32.max
//           }
           let plan = BitcoinTransactionPlan.with {
               $0.amount = 3000
               $0.fee = 2000
               $0.change = 15000
               $0.utxos = utxos
               
//               ,utxo1,utxo2,utxo3,utxo4
//
   //
           }
           let scriptHash = script.matchPayToPubkeyHash()!
           let input = BitcoinSigningInput.with {
               $0.toAddress = "tb1qx42tcdxqsdgl32jzuwt4p67y7lp2mf89zw380e"
               $0.changeAddress = address.description
               $0.hashType = BitcoinScript.hashTypeForCoin(coinType: .bitcoin)
               $0.coinType = CoinType.bitcoin.rawValue
               $0.scripts = [
                   scriptHash.hexString: BitcoinScript.buildPayToPublicKeyHash(hash: pubkey.bitcoinKeyHash).data
               ]
               $0.privateKey = [key.data]
               $0.plan = plan

           }
           let output: BitcoinSigningOutput = AnySigner.sign(input: input, coin: .bitcoin)


                     let encoded = output.encoded

              print(encoded.hexString)
          }

    
  
    
}
extension URL {
    static func createFolder(folderName: String) -> URL? {
        let fileManager = FileManager.default
        // Get document directory for device, this should succeed
        if let documentDirectory = fileManager.urls(for: .documentDirectory,
                                                    in: .userDomainMask).first {
            // Construct a URL with desired folder name
            let folderURL = documentDirectory.appendingPathComponent(folderName)
            // If folder URL does not exist, create it
            if !fileManager.fileExists(atPath: folderURL.path) {
                do {
                    // Attempt to create folder
                    try fileManager.createDirectory(atPath: folderURL.path,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
                } catch {
                    // Creation failed. Print error & return nil
                    print(error.localizedDescription)
                    return nil
                }
            }
            // Folder either exists, or was created. Return URL
            return folderURL
        }
        // Will only be called if document directory not found
        return nil
    }
}
