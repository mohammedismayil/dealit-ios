//
//  VC2.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit

class VC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func nextAction(_ sender: Any) {
        
        moveToNextVC()
    }
    
    
    func moveToNextVC() {
        let story = UIStoryboard(name: "SampleVCS", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "VC3") as! VC3
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
