////
////  WalletConnectClientVC.swift
////  Dealit
////
////  Created by Mohammed Ismayil on 16/07/22.
////
//
//import Foundation
//
//import UIKit
//class WalletConnectClientVC: UIViewController {
//    var handshakeController: HandshakeViewController!
//    var actionsController: ActionsViewController!
//    var walletConnect: WalletConnect!
//    
//    
//    
//
//    @IBAction func connect(_ sender: Any) {
//        let connectionUrl = walletConnect.connect()
//
//        /// https://docs.walletconnect.org/mobile-linking#for-ios
//        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
//        /// Here deep link provided for integration with server test app only
//        let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            } else {
//                self.handshakeController = HandshakeViewController.create(code: connectionUrl)
//                self.present(self.handshakeController, animated: true)
//            }
//        }
//        
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//       
//        walletConnect = WalletConnect(delegate: self)
//        walletConnect.reconnectIfNeeded()
//    }
//
//    func onMainThread(_ closure: @escaping () -> Void) {
//        if Thread.isMainThread {
//            closure()
//        } else {
//            DispatchQueue.main.async {
//                closure()
//            }
//        }
//    }
//}
//
//extension WalletConnectClientVC: WalletConnectDelegate {
//    func failedToConnect() {
//        onMainThread { [unowned self] in
//            if let handshakeController = self.handshakeController {
//                handshakeController.dismiss(animated: true)
//            }
//            UIAlertController.showFailedToConnect(from: self)
//        }
//    }
//
//    func didConnect() {
//        onMainThread { [unowned self] in
//            self.actionsController = ActionsViewController.create(walletConnect: self.walletConnect)
//            if let handshakeController = self.handshakeController {
//                handshakeController.dismiss(animated: false) { [unowned self] in
//                    self.present(self.actionsController, animated: false)
//                }
//            } else if self.presentedViewController == nil {
//                self.present(self.actionsController, animated: false)
//            }
//        }
//    }
//
//    func didDisconnect() {
//        onMainThread { [unowned self] in
//            if let presented = self.presentedViewController {
//                presented.dismiss(animated: false)
//            }
//            UIAlertController.showDisconnected(from: self)
//        }
//    }
//}
//
//extension UIAlertController {
//    func withCloseButton() -> UIAlertController {
//        addAction(UIAlertAction(title: "Close", style: .cancel))
//        return self
//    }
//
//   
//}
