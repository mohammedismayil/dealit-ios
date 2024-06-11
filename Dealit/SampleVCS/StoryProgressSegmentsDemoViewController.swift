//
//  StoryProgressSegmentsDemoViewController.swift
//  Dealit
//
//  Created by Mohammed Ismayil M on 11/06/24.
//

import UIKit

class StoryProgressSegmentsDemoViewController: UIViewController {

    var segmentAView: UIView  = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .gray
        // Do any additional setup after loading the view.
        
//        segmentAView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentAView)
       
        segmentAView.frame = CGRect(x: 100, y: 250, width: 0, height: 20)
        segmentAView.backgroundColor = .purple
        segmentAView.layer.cornerRadius = 10
        let animator = UIViewPropertyAnimator(duration: 2, curve: .linear)
        
        animator.addAnimations {
            self.segmentAView.frame = CGRect(x: 100, y: 250, width: 200, height: 20)
        }
        
        animator.startAnimation()
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
