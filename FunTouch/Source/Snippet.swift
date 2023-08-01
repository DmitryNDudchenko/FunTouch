//
//  Snippet.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 20.07.2023.
//

import Foundation

// Учбовий приклад UserDefaults
func userDefaults() {
    
    var dict = [
        "name" : "Dmutro",
        "Language" : "Swift"
    ]
    
    let name = "Dmutro"
    
    UserDefaults.standard.set(name, forKey: "name") // Встановлення змінної
    UserDefaults.standard.removeObject(forKey: "name") // Видалення значення
    
    guard let name = UserDefaults.standard.string(forKey: "name") else { // безпечний доступ і повернення значення
        return
    }
    
    let defaults = UserDefaults.standard // Скорочення синтаксису
    
    let newName = defaults.string(forKey: "name") ?? "Unknown"
    
}
