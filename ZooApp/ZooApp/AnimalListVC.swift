//
//  AnimalListVC.swift
//  ZooApp
//
//  Created by Berkin KABADAYI on 4.01.2021.
//

import UIKit

final class AnimalListVC: UIViewController {
    
    var animalList: [Animals] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    fileprivate func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.reloadData()
    }
    
    fileprivate func prepareLayers(object: Any) {
        if let object = object as? UIControl {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UIView {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension AnimalListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.setCell(newAnimal: animalList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension AnimalListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
