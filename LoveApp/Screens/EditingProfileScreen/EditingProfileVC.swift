//
//  EditingProfileVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 6.08.2023.
//

import UIKit

class EditingProfileVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoIcon: UIImageView!
    
    // MARK: - Properties
    var previouslySelectedIndexPath : IndexPath?
//    let models : [EditingProfileModel] = [EditingProfileModel(icon: UIImage(systemName: ""), title: <#T##String#>, answer: <#T##String#>)]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "EditingProfileCellTableViewCell", bundle: nil), forCellReuseIdentifier: "editingProfileTableCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - Functions
    
    // MARK: - Actions
}
    // MARK: - Extensions
extension EditingProfileVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editingProfileTableCell", for: indexPath) as! EditingProfileCellTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Önceki seçilen hücreyi eski durumuna getir
            if let previousIndexPath = previouslySelectedIndexPath,
               let previousCell = tableView.cellForRow(at: previousIndexPath) as? EditingProfileCellTableViewCell {
                previousCell.answerLabel.backgroundColor = .systemGray6 // ya da başka bir renk
            }
        if let cell = tableView.cellForRow(at: indexPath) as? EditingProfileCellTableViewCell {
            cell.answerLabel.backgroundColor = .purple
            }
        previouslySelectedIndexPath = indexPath
    }
}
   





