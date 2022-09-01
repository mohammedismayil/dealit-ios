//
//  PropertyObserverVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 01/09/22.
//

import UIKit

class User{
    var name:String
    var age:Int
    
    init(){
        self.name = ""
        self.age = 0
    }
}

class PropertyObserverVC: UIViewController {

    @IBOutlet weak var propertyObserverTbl: UITableView!
    var users = [User](){
        didSet{
            self.propertyObserverTbl.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.propertyObserverTbl.dataSource = self
        self.propertyObserverTbl.delegate = self
        
        self.users = [User(),User()]
    
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addUser(_ sender: Any) {
        self.users.append(User())
    }
}
extension PropertyObserverVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyObserverTVC", for: indexPath)
        
        return cell
    }
    
    
}
class PropertyObserverTVC:UITableViewCell{
    
    @IBOutlet weak var nameLbl: UILabel!
}
