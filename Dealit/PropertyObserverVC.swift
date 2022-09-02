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
    
    init(name:String,age:Int){
        self.name = name
        self.age = age
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
        print("viewDidLoad called")
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationTriggered), name:  Notification.Name("UserLoggedIn"), object: nil)
        self.propertyObserverTbl.dataSource = self
        self.propertyObserverTbl.delegate = self
        
        self.users = [User(name: "Johan", age: 19),User(name: "Johan", age: 25)]
    
    }
    
    @objc func notificationTriggered(notif:Notification){
        
        if let dict = notif.object as? User {
            print("i am triggered from vc2 \(dict.name)")
            self.users.append(User(name: "Peter", age: 30))
            }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Will appear called")
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
       
        
                let story = UIStoryboard(name: "SampleVCS", bundle:nil)
                let vc = story.instantiateViewController(withIdentifier: "VC2") as! VC2
                self.navigationController?.pushViewController(vc, animated: true)
                
    }
}
extension PropertyObserverVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyObserverTVC", for: indexPath) as! PropertyObserverTVC
        cell.nameLbl.text = self.users[indexPath.row].name
        
        return cell
    }
    
    
}
class PropertyObserverTVC:UITableViewCell{
    
    @IBOutlet weak var nameLbl: UILabel!
}
