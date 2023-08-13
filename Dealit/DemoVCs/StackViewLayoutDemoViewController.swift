//
//  StackViewLayoutDemoViewController.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 13/08/23.
//

import UIKit

class StackViewLayoutDemoViewController: UIViewController {
    
    private var stackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.backgroundColor = .gray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private var headerView: UIView  = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var subHeaderView: UIView  = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var thirdView: UIView  = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    
    func setUpUI() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(subHeaderView)
        stackView.addArrangedSubview(thirdView)
        stackView.addArrangedSubview(tableView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            subHeaderView.heightAnchor.constraint(equalToConstant: 50),
            thirdView.heightAnchor.constraint(equalToConstant: 50),
            tableView.heightAnchor.constraint(equalToConstant: 50)
        ])
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
