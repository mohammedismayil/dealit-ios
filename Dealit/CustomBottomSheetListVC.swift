//
//  CustomBottomSheetListVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 28/08/22.
//

import UIKit

class CustomBottomSheetListVC: UIViewController {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var sheetView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor.clear
//        self.view.isOpaque = false
       
//        view.backgroundColor = .black
//        view.alpha = 0.65
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        bgView.addGestureRecognizer(tap)
        sheetView.roundCorners([.topLeft, .topRight], radius: 15)
        
    }
    
    @objc func handleTap(){
        self.dismiss(animated: true, completion: nil)
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
extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
