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
    @IBAction func createAction(_ sender: Any) {
       
        
        if let keyDirectory = try? KeyStore.init(keyDirectory: URL.createFolder(folderName: "wallet") ?? URL(fileURLWithPath: "wallet")) {
            
            
            
            if let keyPri = try? keyDirectory.import(privateKey: PrivateKey(data: Data(hexString: privateKey ) ?? Data()) ?? PrivateKey(), name: "", password: "", coin: .ethereum) {
                
                
                let signerInput = EthereumSigningInput.with {
                    $0.nonce = Data(hexString: "07")!
                    $0.chainID = Data(hexString: "04")!
                    $0.gasPrice = Data(hexString: "D693A400")!// decimal 3600000000
                    $0.gasLimit = Data(hexString: "6978")! // decimal 21000
                    $0.toAddress = "0xC37054b3b48C3317082E7ba872d7753D13da4986"
                    $0.maxFeePerGas = Data(hexString: "9502F900")! // 2500000000
                    $0.transaction = EthereumTransaction.with {
                       $0.transfer = EthereumTransaction.Transfer.with {
                           $0.amount = Data(hexString: "0.004189374BC6A7EF9DB2") ?? Data()
                       }
                    }
                    
                    if let privky = try? keyDirectory.wallets[0].privateKey(password: "", coin: .ethereum).data {
                        $0.privateKey = privky
                    }
                    
                }
                let output: EthereumSigningOutput = AnySigner.sign(input: signerInput, coin: .ethereum)
                print(" data:   ", output.encoded.hexString)
                print(output.data.hexString)
            }
          
        }
        
        
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
