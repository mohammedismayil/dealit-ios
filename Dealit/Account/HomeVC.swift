//
//  HomeVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit
import NotificationCenter
class HomeVC: UIViewController {

    @IBOutlet weak var homeTbl: UITableView!
    @IBOutlet weak var homeNameLbl: UILabel!
    
    var homeUsers = [HomeUserProfileModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        homeTbl.register(UINib(nibName: "HomeTVC", bundle: nil), forCellReuseIdentifier: "HomeTVC")
        homeTbl.delegate = self
        homeTbl.dataSource = self
      
//        NotificationCenter.default.addObserver(self, selector: #selector(notificationTriggered), name:  Notification.Name("UserLoggedIn"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(notificationTriggered), name:  Notification.Name("UserLoggedIn"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(notificationTriggered), name:  Notification.Name("UserLoggedIn"), object: nil)
        
        NetworkManager.getData { (model) in
            print(model.users)
            self.homeUsers = model.users
            self.homeTbl.reloadData()
        }
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        logoutUser()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        moveToNextVC()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func notificationTriggered(notif:Notification){
        
        if let dict = notif.object as? String {
            print("i am triggered from HomeVC \(dict)")
            self.homeNameLbl.text = dict
            }
        
    }
    func moveToNextVC() {
        let story = UIStoryboard(name: "SampleVCS", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "VC2") as! VC2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func logoutUser(){
        LocalAppData.setUserStatus(status: .notloggedIn)
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        
        let navigationController = UINavigationController(rootViewController: vc)
       
        let app = UIApplication.shared.delegate as! AppDelegate
        app.window?.rootViewController = navigationController
        app.window?.makeKeyAndVisible()
        
    }

}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTbl.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as? HomeTVC else { return UITableViewCell() }
        cell.setCellData(data: homeUsers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
