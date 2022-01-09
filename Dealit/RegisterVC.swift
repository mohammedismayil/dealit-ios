//
//  RegisterVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit

class RegisterVC: UIViewController {

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
    @IBAction func loginAction(_ sender: Any) {
        LocalAppData.setUserStatus(status: .loggedIn)
        
        
        moveToHome()
        
    }
    
    
    func moveToHome(){
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let app = UIApplication.shared.delegate as! AppDelegate
        app.window?.rootViewController = vc
        app.window?.makeKeyAndVisible()
    }
    
}
