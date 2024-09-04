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

        self.view.backgroundColor = .yellow
        addLetterAnimation()
    }
    
    func addLetterAnimation() {
        // Create the path for the letter "A"
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 150))
        path.addCurve(to: CGPoint(x: 150, y: 150), controlPoint1: CGPoint(x: 120, y: 110), controlPoint2: CGPoint(x: 140, y: 135))
        path.addCurve(to: CGPoint(x: 100, y: 215), controlPoint1: CGPoint(x: 160, y: 170), controlPoint2: CGPoint(x: 150, y: 210))
        path.addCurve(to: CGPoint(x: 100, y: 180), controlPoint1: CGPoint(x: 20, y: 195), controlPoint2: CGPoint(x: 50, y: 185))
//        path.addLine(to: CGPoint(x: 200, y: 100))
//        path.addLine(to: CGPoint(x: 200, y: 200))
//        path.addLine(to: CGPoint(x: 100, y: 200))
//        path.addLine(to: CGPoint(x: 100, y: 150))
//        path.addLine(to: CGPoint(x: 250, y: 150))
//        path.addLine(to: CGPoint(x: 250, y: 100))
//        path.addLine(to: CGPoint(x: 250, y: 200))
       
       
//        path.addLine(to: CGPoint(x: 200, y: 200))
//        path.move(to: CGPoint(x: 125, y: 150))
//        path.addLine(to: CGPoint(x: 175, y: 150))
        
        // Create a shape layer for the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        // Add the shape layer to the view
        view.layer.addSublayer(shapeLayer)
        
        // Create the animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2.0
        
        // Add the animation to the shape layer
        shapeLayer.add(animation, forKey: "drawLetterA")
    }
    
    func addSegmentAnimation() {
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
