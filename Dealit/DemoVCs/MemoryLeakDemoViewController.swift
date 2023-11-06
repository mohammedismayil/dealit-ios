//
//  MemoryLeakDemoViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 18/10/23.
//

import UIKit

class MemoryLeakDemoViewController: UIViewController {

   
    var closure: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        self.simpleClosureReference()
        
    }
    
    deinit {
        print("MemoryLeakDemoViewController is being deallocated")
    }
    
    func simpleClosureReference() {
        
        self.closure = {
            print("View controller is still in memory")
            print(self.view.frame)
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
