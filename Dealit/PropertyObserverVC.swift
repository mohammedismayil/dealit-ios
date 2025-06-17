//
//  PropertyObserverVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 01/09/22.
//

import UIKit



class PropertyObserverVC: UIViewController {

    @IBOutlet weak var propertyObserverTbl: UITableView!
    var users = [Homeuser](){
        didSet{
            self.propertyObserverTbl.reloadData()
        }
    }
    
    
    
    
    
//    let constUsers = [User](){
//        didSet{
//            self.propertyObserverTbl.reloadData()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("viewDidLoad called")
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationTriggered), name:  Notification.Name("UserLoggedIn"), object: nil)
        self.propertyObserverTbl.dataSource = self
        self.propertyObserverTbl.delegate = self
        
//        self.users = [User(name: "Johan", age: 19),User(name: "Johan", age: 25)]
        self.getUsers()
    
    }
    
    @objc func notificationTriggered(notif:Notification){
        
//        if let dict = notif.object as? User {
//            print("i am triggered from vc2 \(dict.name)")
////            self.users.append(User(name: "Peter", age: 30))
//            }
        
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
    
    
    func getUsers(){
        
        let cacheData = CoreDataHandler.shared.getRawResponse(API: .users)
        
        var datas = cacheData["json"] as? String
        
        
        var final = datas!.toData()
        let model = try? JSONDecoder().decode(HomeUsersModel.self, from: final as! Data)
        
        
        print(model)
        
//        array = cacheData["json"] as! [[String:Any]]
       
//        print("Type of \(type(of: cacheData))")
//        print("Type of \(type(of: cacheData["json"].flatMap(<#T##transform: (Any) throws -> U?##(Any) throws -> U?#>)))")
        
//        do {
//            var array = JSON()
//            let dd =  cacheData["json"] as! String
//
//            let con = try JSONSerialization.jsonObject(with: dd.data(using: .utf8)!, options: []) as! [String:Any]
//
//        catch {
//           print(error)
//        }
       
        NetworkManager.getRequestAPI(callBack: { (decoded) in
//            print(decoded)
            
            
            let respModel:HomeUsersModel!

            respModel = decoded

            print(respModel.homeusers.map({$0.name}))
          let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try! encoder.encode(respModel)
            print(String(data: data, encoding: .utf8)!)
            let jsonr = String(data: data, encoding: .utf8)!

            
            CoreDataHandler.shared.saveRawResponse(API: .users, response: jsonr)
        }, model: HomeUsersModel.self, url: "https://run.mocky.io/v3/e7e78ac5-b61d-4793-b565-bd71e7d2582e")
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
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    func toData() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return data
    }
}
