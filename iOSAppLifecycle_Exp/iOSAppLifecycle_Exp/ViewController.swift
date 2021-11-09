//
//  ViewController.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/7/21.
//

import UIKit

class ViewController: UITableViewController {
    // SHAK: Properties
//    var names = ["Sam", "Nima", "James", "Rihanna"]
//    var cellID = "cell"
    var state: State?
    
    init(state: State?) {
        self.state = state
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.navigationBar.prefersLargeTitles = true
//        title = "Names List"
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return names.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        let indexPath = names[indexPath.row]
//        cell.textLabel?.text = indexPath
//        return cell
//    }
}

