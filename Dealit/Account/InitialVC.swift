//
//  InitialVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit

class InitialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("hello from initial vc")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moveToScreen()
    }
    
    
    
    func moveToScreen(){
        let status = LocalAppData.getUserStatus()
        
        switch status {
        case .loggedIn:
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
           
            let navigationController = UINavigationController(rootViewController: vc)
           
            let app = UIApplication.shared.delegate as! AppDelegate
            app.window?.rootViewController = navigationController
            app.window?.makeKeyAndVisible()
        case .notloggedIn:
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            let navigationController = UINavigationController(rootViewController: vc)
           
            let app = UIApplication.shared.delegate as! AppDelegate
            app.window?.rootViewController = navigationController
            app.window?.makeKeyAndVisible()
        }
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
