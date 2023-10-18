//
//  InitialBlankViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 15/07/23.
//

import UIKit

class InitialBlankViewController: UIViewController {

    private let nextButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.gray
        self.setupUI()
    }
    

    
    func setupUI() {
        self.view.translatesAutoresizingMaskIntoConstraints = true
        self.nextButton.translatesAutoresizingMaskIntoConstraints = true
        self.nextButton.backgroundColor = .green
        nextButton.setTitle("Next", for: .normal)
        self.nextButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        self.view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    }
    
    @objc func nextAction() {
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "MemoryLeakDemoViewController") as! MemoryLeakDemoViewController
        self.present(vc, animated: true) {
            print("Completion after presenting VC")
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
