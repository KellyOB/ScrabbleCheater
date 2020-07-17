//
//  Tile.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/15/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

struct Tile {
    let letter: String?
    
    var tileValue: Int? {
        return getTileValue(letter: letter ?? "a")
    }
    
    func getTileValue(letter: String) -> Int {
        switch letter {
        case "a", "e", "i", "o", "u", "n", "r","t", "l", "s":
            return 1
        case "d", "g":
            return 2
        case "b", "c", "m", "p":
            return 3
        case "f", "h", "v", "w", "y":
            return 4
        case "k":
            return 5
        case "j", "x":
            return 8
        case "q", "z":
            return 10
        default:
            return 0
        }
    }
}
