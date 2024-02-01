//
//  DemoPaginationViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 05/12/23.
//

import UIKit
import CoreData

class DemoPaginationViewController: UIViewController {
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .purple
        return tableView
    }()
    
    var fetchController: NSFetchedResultsController<NSFetchRequestResult>!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DemoPaginationUser")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        fetchController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        self.view.addSubview(tableView)
        tableView.backgroundColor = .green
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        tableView.register(DemoPaginationListCell.self, forCellReuseIdentifier: "DemoPaginationListCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
        
        fetchCalls()
    }
    
    
    func fetchCalls() {
        var callSummary: [CallSummary]? = []
        
        var initialCalls = [Call(id: "1", name: "A"),Call(id: "2", name: "B"),Call(id: "3", name: "B")]
        
        var nextSetOfCalls = [Call(id: "4", name: "A"),Call(id: "5", name: "B"),Call(id: "6", name: "C")]
        
        var syncData = [Call(id: "7", name: "B"),Call(id: "8", name: "B"),Call(id: "9", name: "A"),Call(id: "10", name: "A")]
        
        for call in initialCalls {
             if call.name == callSummary?.last?.calls?.first?.name {
                 callSummary?.last?.id = call.id
                callSummary?.last?.calls?.append(call)
            } else {
                callSummary?.append(CallSummary(id: "s\(call.id.description))", calls: [call]))
            }
        }

        for call in nextSetOfCalls {
           if call.name == callSummary?.last?.calls?.first?.name {
               callSummary?.last?.id = call.id
                callSummary?.last?.calls?.append(call)
            } else {
                callSummary?.append(CallSummary(id: "s\(call.id.description))", calls: [call]))
            }
        }
        
        for call in syncData {
            if call.name == callSummary?.first?.calls?.first?.name {
                callSummary?.first?.id = call.id
                callSummary?.first?.calls?.append(call)
            } else {
                callSummary?.insert(CallSummary(id: "s\(call.id.description))", calls: [call]), at: 0)
            }
        }
//
        let summaryStrings = callSummary?.map { summary in
            return "ID: \(summary.id), Calls: [\(summary.calls.map { "\($0.id.description): \($0.name.description)" }.joined(separator: ", "))]"
            }
            
        summaryStrings?.forEach { print($0) }
        
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

extension DemoPaginationViewController :  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "DemoPaginationListCell", for: indexPath) as! DemoPaginationListCell
//        let object = fetchController.object(at: indexPath)
//        cell.nameLabel.text = object.entity.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

class DemoPaginationListCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    class var reuseIdentifier: String {
        get {
            return "DemoPaginationListCell"
        }
    }
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


class CallSummary {
    var id:String!
    var calls:[Call]!
    
    var description: String {
            return "CallSummary - ID: \(id), Calls: \(calls)"
        }
    init(id: String, calls: [Call]) {
        self.id = id
        self.calls = calls
    }
    
}
class Call {
    var id:String!
    var name:String!
    var description: String {
            return "Call - ID: \(id), Name: \(name)"
        }
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
