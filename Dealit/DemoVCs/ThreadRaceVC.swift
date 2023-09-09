//
//  ThreadRaceVC.swift
//  Dealit
//
//  Created by ismayil-16441 on 09/09/23.
//

import UIKit

class ThreadRaceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.runMainThread()
    }
    

    func runMainThread() {
        DispatchQueue.main.async {
            for i in 0..<10 {
                print("Priting asynchronously in main thread \(i)")
            }
        }
        for i in 0..<10 {
            print("Priting synchronously in main thread \(i)")
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
