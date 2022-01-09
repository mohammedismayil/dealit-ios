//
//  VC3.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit

class VC3: UIViewController {

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
    
    
    @IBAction func nextAction(_ sender: Any) {
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("UserLoggedIn"), object: "john")
    }

}
