//
//  NotificationRemovalDemoViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 25/09/23.
//

import UIKit
import SimpleCustomUIComponentsSwift

class NotificationRemovalDemoViewController: UIViewController {

    private var sendNotificationButton: CustomAddButton  = {
        let button = CustomAddButton()
        button.backgroundColor = .purple
        button.setTitle("Send Notification", for: .normal)
        return button
    }()
    
    private var removeNotificationButton: CustomAddButton  = {
        let button = CustomAddButton()
        button.backgroundColor = .purple
        button.setTitle("Remove Notification", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.view.addSubview(sendNotificationButton)
        sendNotificationButton.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: (self.view.frame.height / 2) - 100, width: 200, height: 50)
        sendNotificationButton.addTarget(self, action:  #selector(sendNotification), for: .touchUpInside)
        
        self.view.addSubview(removeNotificationButton)
        removeNotificationButton.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: (self.view.frame.height / 2), width: 200, height: 50)
        removeNotificationButton.addTarget(self, action:  #selector(sendNotification), for: .touchUpInside)
    }
    
    @objc func sendNotification() {
        print("Send notification")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
