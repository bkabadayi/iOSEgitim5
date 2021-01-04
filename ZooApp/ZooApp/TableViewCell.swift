//
//  TableViewCell.swift
//  ZooApp
//
//  Created by Berkin KABADAYI on 4.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        prepareLayer(object: cellLabel as Any)
        
        // Configure the view for the selected state
    }
    
    fileprivate func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 7
            object.layer.masksToBounds = true
        }
    }
    
    func setCell (newAnimal: Animals) {
        cellLabel.text = newAnimal.animalName + "\t\t\t" + newAnimal.animalSound + "\t\t\t" + String(newAnimal.animalConsumeWater)
    }
}
