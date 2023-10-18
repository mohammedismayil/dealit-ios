//
//  ButtonBackgroundBezierPathDemoViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 04/10/23.
//

import UIKit

class ButtonBackgroundBezierPathDemoViewController: UIViewController {

    
    private var continueButton: DemoContinueButton  = {
        let button = DemoContinueButton()
        button.backgroundColor = .purple
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.checkTwoViews()
       
    }
    
    
    func checkTwoViews() {
        let view1 = UIView()
        view1.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view1.backgroundColor = .green
        
        let view2 = UIView()
        view2.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view2.backgroundColor = .yellow
        
        self.view.addSubview(view1)
        
        self.view.insertSubview(view2, at: 0)
    }
    
    func handleButtonDemo() {
        let buttonBackGroundViewFromOutSide = UIButton()
        buttonBackGroundViewFromOutSide.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        buttonBackGroundViewFromOutSide.backgroundColor = .yellow
        continueButton.addSubview(buttonBackGroundViewFromOutSide)
        
        self.view.addSubview(continueButton)
        continueButton.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: (self.view.frame.height / 2) - 100, width: 200, height: 50)
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

class DemoContinueButton:UIButton {
    
    
    private let cornerRadius = 10
    private let titleFontSize = 18
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor.purple
        self.setTitleColor(.white, for: .normal)
        self.setTitle("Add", for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(titleFontSize))
        self.layer.cornerRadius = CGFloat(cornerRadius)
        let buttonBackGroundView = UIButton()
        buttonBackGroundView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        buttonBackGroundView.backgroundColor = .green
        self.addSubview(buttonBackGroundView)
        let buttonBackGroundView2 = UIButton()
        buttonBackGroundView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        buttonBackGroundView.backgroundColor = .red
        self.insertSubview(buttonBackGroundView2, at: 0)
//        buttonBackGroundView.roundCorners(corners: [.topLeft, .topRight], radius: 0.5 * self.bounds.size.width)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
