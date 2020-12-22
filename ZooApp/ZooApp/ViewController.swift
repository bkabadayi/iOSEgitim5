//
//  ViewController.swift
//  ZooApp
//
//  Created by Berkin KABADAYI on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zooLabel: UILabel!
    @IBOutlet weak var dailyWaterLabel: UILabel!
    @IBOutlet weak var waterLimitLabel: UILabel!
    @IBOutlet weak var insLabel: UILabel!
    @IBOutlet weak var animalNameLabel: UITextField!
    @IBOutlet weak var animalSoundLabel: UITextField!
    @IBOutlet weak var animalWaterLabel: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var myZoo = Zoo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zooLabel.layer.cornerRadius = 20
        zooLabel.layer.masksToBounds = true
        zooLabel.text = "Welcome to \(myZoo.getZooName())"
        
        dailyWaterLabel.layer.cornerRadius = 15
        dailyWaterLabel.layer.masksToBounds = true
        
        waterLimitLabel.layer.cornerRadius = 15
        waterLimitLabel.layer.masksToBounds = true
        waterLimitLabel.text = "Water Limit: \(myZoo.getDailyConsumeWaterLimit()) L"
        
        insLabel.layer.cornerRadius = 15
        insLabel.layer.masksToBounds = true
        
        
        animalNameLabel.layer.cornerRadius = 10
        animalNameLabel.layer.masksToBounds = true
        
        animalSoundLabel.layer.cornerRadius = 10
        animalSoundLabel.layer.masksToBounds = true
        
        animalWaterLabel.layer.cornerRadius = 10
        animalWaterLabel.layer.masksToBounds = true
        
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
    }
    
    @IBAction func addAnimalButton(_ sender: Any) {
        if animalNameLabel.text != "" && animalSoundLabel.text != "" && animalWaterLabel.text != "" {
            if myZoo.getDailyConsumeWaterLimit() != myZoo.getTotalConsumeWater() + (Int (animalWaterLabel.text ?? "") ?? 0) {
                let newAnimal = Animals ()
                newAnimal.animalName = animalNameLabel.text ?? ""
                newAnimal.animalSound = animalSoundLabel.text ?? ""
                newAnimal.animalConsumeWater = Int (animalWaterLabel.text ?? "") ?? 0
                myZoo.addNewAnimal(newAnimal: newAnimal)
                
                let alertAddedAnimal = UIAlertController(title: "Congratulations!", message: "You added a new animal to zoo!", preferredStyle: .alert)
                alertAddedAnimal.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertAddedAnimal, animated: true)
//                var Animalmessage : [String] = [""]
//                for item in myZoo.getAnimalList() {
//                    Animalmessage.append("\(item.animalName)   \(item.animalSound)   \(item.animalConsumeWater)")
//                }
//                for item in 1...myZoo.getAnimalListCount() {
//                        insLabel.text = Animalmessage[item-1]
//                    }
                insLabel.text = "We have \(myZoo.getAnimalListCount()) animals in our zoo"
                dailyWaterLabel.text = "Daily Consume: \(myZoo.getTotalConsumeWater()) L"
            }
            else {
                let alertWater = UIAlertController(title: "You have exceeded the water consumption!", message: "Your animal consumes water too much! \n Please decrease the water consuption.", preferredStyle: .alert)
                alertWater.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertWater, animated: true)
            }
        }
        else {
            let alertFillAllAreas = UIAlertController(title: "You filled the fields incompletely!", message: "Please fill all fields", preferredStyle: .alert)
            alertFillAllAreas.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertFillAllAreas, animated: true)
        }
    }
}
