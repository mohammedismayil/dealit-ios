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

        // Do any additional setup after loading the view.
        
        
        
        self.closure = {
            // This closure retains a strong reference to the view controller
            // It keeps the view controller in memory even after it's dismissed
            print("View controller is still in memory")
        }
        
    }
    

    func fetchData(completion: @escaping () -> Void) {
        // Simulate a network request
        DispatchQueue.global().async {
            // Fake data retrieval
            sleep(5)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func handleData() {
        print("Data handled")
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
