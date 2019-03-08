//
//  RandomStringGenerator.swift
//  Master Detail with Header Child ViewController
//
//  Created by Arifin Firdaus on 3/8/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import Foundation

class RandomStringGenerator {
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
}
