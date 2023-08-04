//
//  SettingsVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 3.08.2023.
//

import UIKit

class SettingsVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        
    }
    // MARK: - Functions
    func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingsTableCell", bundle: nil), forCellReuseIdentifier: "sTableCell")
    }
    // MARK: - Actions
}
// MARK: - Extensions
extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sTableCell", for: indexPath) as! SettingsTableCell
        return cell
    }
    
    
}


