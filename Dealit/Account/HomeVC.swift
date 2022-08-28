//
//  HomeVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import UIKit
import NotificationCenter
import CoreData
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
        
    
             
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchUsersData()
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
//        let story = UIStoryboard(name: "SampleVCS", bundle:nil)
//        let vc = story.instantiateViewController(withIdentifier: "VC2") as! VC2
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let story = UIStoryboard(name: "Common", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "CustomBottomSheetListVC") as! CustomBottomSheetListVC
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
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
   
    
    func fetchUsersData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserList")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if result.count > 0 {
                self.homeUsers.removeAll()
                let core = UserlistCoreDataHandler.shared
                let data = core.getUserList()
                
//                self.homeUsers = data
                self.homeTbl.reloadData()
            }else{
                NetworkManager.getData { (model) in
//                    print(model.users)
                    
                  
                    let core = CoreDataHandler.shared
                    self.homeUsers.removeAll()
                    let datas = core.createUsers(users: model.users)
                    self.homeUsers.removeAll()
                    self.homeUsers = UserlistCoreDataHandler.shared.getUserList()
//                    self.homeUsers.removeAll()
//                    for data in datas {
//                                   print(data.value(forKey: "name") as! String)
//                        self.homeUsers.append(HomeUserProfileModel.init(desc: data.value(forKey: "desc") as! String, name: data.value(forKey: "name")  as! String, image: data.value(forKey: "image")  as! String ))
//                               }
                    
                    if self.homeUsers.count > 0 {
                        self.homeTbl.reloadData()
                    }
                   
                }
            }
        } catch {
            
            print("Failed")
        }
    }
    
    func saveUserData(){
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Now let’s create an entity and new user records.
            let userEntity = NSEntityDescription.entity(forEntityName: "UserDetail", in: managedContext)!
            
            //final, we need to add some data to our newly created record for each keys using
            //here adding 5 data with loop
            
        for _ in 0..<homeUsers.count {
                
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("ismayil", forKeyPath: "name")
                user.setValue("23", forKey: "age")
                user.setValue("male", forKey: "sex")
            }

            //Now we have set all the values. The next step is to save them inside the Core Data
            
            do {
                try managedContext.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }

}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("total array count \(homeUsers.count)")
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetail")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if result.count > 0 {
                
                for data in result as! [NSManagedObject] {
                               print(data.value(forKey: "name") as! String)
                   
                           }
            }else{
               
                    self.saveUserData()
                
            }
        } catch {
            
            print("Failed")
        }
 
    }
}
