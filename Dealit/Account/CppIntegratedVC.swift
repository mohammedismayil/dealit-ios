//
//  CppIntegratedVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 25/07/22.
//


//add header and method files
//add bridging header file
//created header and method files and changed the names to .hpp and .mm
//

import UIKit

class CppIntegratedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cppobj = HelloCpp()
        
        cppobj.sayHelloToThisDamnWorld()
        cppobj.checkEveryThingisFine()
        
        callThisWork(authenticator: { (message) in
            print(message)
        }, givenCommission: 20)
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
    
    
    
    func callThisWork(authenticator:@escaping (String) ->Void,givenCommission:Int){
        
        
        print("Calling everyone")
        
        
        if givenCommission > 10{
            
            callNearByAgent(commissionForAgent: 3) { (message) in
                authenticator("approved")
            }
           
//            print("printing \(con)")
        }
        
    }
    
    func callNearByAgent(commissionForAgent:Int,agentAuthenticator:@escaping (String)->Void){
     
        
        
        if commissionForAgent > 2{
            agentAuthenticator("approved")
        }else{
            agentAuthenticator("rejected")
        }
    }

}
