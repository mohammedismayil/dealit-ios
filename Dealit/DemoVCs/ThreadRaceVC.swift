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
        self.checkConcurrenThread()
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
    
    func checkConcurrenThread() {
        let concurrentQueue = DispatchQueue(label: "Concurrent", attributes: .concurrent)
        concurrentQueue.async {
            for i in 0..<10 {
                print("Priting concurrentQueue \(i)")
            }
        }
        concurrentQueue.async {
            for i in 10..<20 {
                print("Priting concurrentQueue \(i)")
            }
        }
        concurrentQueue.async {
            for i in 20..<30 {
                print("Priting concurrentQueue \(i)")
            }
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
