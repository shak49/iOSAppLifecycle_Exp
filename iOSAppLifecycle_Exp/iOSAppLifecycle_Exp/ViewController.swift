//
//  ViewController.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/7/21.
//

import UIKit

class ViewController: UIViewController {
    // SHAK: Properties
//    var names = ["Sam", "Nima", "James", "Rihanna", "Nirvana"]
//    var cellID = "cell"
    
    // SHAK: Outlets
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    
    // SHAK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.navigationBar.prefersLargeTitles = true
//        title = "Names List"
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        viewOne.backgroundColor = UIColor(named: "ColorOne")
        viewTwo.backgroundColor = UIColor(named: "ColorTwo")
        viewThree.backgroundColor = UIColor(named: "ColorThree")
        viewFour.backgroundColor = UIColor(named: "ColorFour")
        themeSegment.selectedSegmentIndex = UserDefaultManager.shared.theme.rawValue
    }
    
    // SHAK: Actions
    @IBAction func themeSegment(_ sender: UISegmentedControl) {
        UserDefaultManager.shared.theme = Theme(rawValue: sender.selectedSegmentIndex) ?? .device
        self.view.window?.overrideUserInterfaceStyle = UserDefaultManager.shared.theme.getUserInterfaceStyle()
    }
    
    // SHAK: Data Source
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

