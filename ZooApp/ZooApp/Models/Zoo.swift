//
//  Zoo.swift
//  ZooApp
//
//  Created by Berkin KABADAYI on 21.12.2020.
//

import Foundation

class Zoo {
    private let zooName = "MyZoo"
    private let dailyConsumeWaterLimit = 1000
    private var animalList : [Animals] = []
    private var totalConsumeWater = 0
    
    init () {
        let dog = Animals()
        let cat = Animals()
        let sheep = Animals()
        let fox = Animals()
        
        dog.animalName = "Dog"
        dog.animalSound = "Rough"
        dog.animalConsumeWater = 15
        
        cat.animalName = "Cat"
        cat.animalSound = "Meow"
        cat.animalConsumeWater = 8
        
        sheep.animalName = "Sheep"
        sheep.animalSound = "Mee"
        sheep.animalConsumeWater = 20
        
        fox.animalName = "Fox"
        fox.animalSound = "?"
        fox.animalConsumeWater = 18
        animalList.append(dog)
        animalList.append(cat)
        animalList.append(sheep)
        animalList.append(fox)
    }
    func getZooName () -> String {
        return zooName
    }
    func getAnimalList () -> [Animals] {
        return animalList
    }
    func getDailyConsumeWaterLimit () -> Int {
        return dailyConsumeWaterLimit
    }
    func addNewAnimal (newAnimal : Animals) {
        animalList.append(newAnimal)
    }
    func getTotalConsumeWater () -> Int {
        totalConsumeWater = 0
        for item in animalList {
            totalConsumeWater += item.animalConsumeWater
        }
        return totalConsumeWater
    }
    func getAnimalListCount () -> Int {
        return animalList.count
    }
}
