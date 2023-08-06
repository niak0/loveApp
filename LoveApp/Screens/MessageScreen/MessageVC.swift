//
//  ChatsVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 1.08.2023.
//

import UIKit

final class MessageVC: UIViewController {
 
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
    var coordinator : Coordinator?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        prepareCollectionView()
        prepareNavigationBar()
 
    }
    // MARK: - Functions
    func prepareNavigationBar() {
        let titleView = UILabel()
        titleView.text = "LoveApp"
        navigationItem.titleView = UIView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:titleView)
        navigationController?.navigationBar.tintColor = .purple
    
    }
    private func prepareCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
    }
    private func prepareTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    // MARK: - Actions
    @objc private func searchBarTapped() {
        
    }
}
// MARK: - Extensions - TableView
extension MessageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.profileNameLbl.text = "Okan Erdinç Arslan"
        cell.messageLbl.text = "O halde yarın 12 gibi buluşalım mı?"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.push(.chatVC, from: self.navigationController!)
    }
    
}
// MARK: - Extensions - CollectionView
extension MessageVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.profileNameLbl.text = "Okain"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 68, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) // Sol, üst, alt ve sağ kenarlardan boşlukları belirleyin
    }
    
}
