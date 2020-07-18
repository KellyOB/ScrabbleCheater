//
//  Scrabble.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/15/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

class Scrabble {
    
    static var shared = Scrabble()
    var trie = Trie()
    
    var bagOfLetters: [String] = ["a", "a","a","a","a","a","a","a","a","b","b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
    
    var bagOfRemainingLetters = [String]()
    var tilesNeeded = 7
    var lettersChosen = [String]()
    var wordsArray = [String]()
    
    init() {
        bagOfRemainingLetters = bagOfLetters
        setUpDictionary()
    }
    
    func pullLettersFromBag(numberOfTiles: Int) -> [String] {
        while bagOfRemainingLetters.count > 7 {
            for _ in 0..<numberOfTiles {
                let randomLetter = Int.random(in: 0...bagOfRemainingLetters.count - 1)
                lettersChosen.append(bagOfRemainingLetters[randomLetter])
                bagOfRemainingLetters.remove(at: randomLetter)
            }
            return lettersChosen
        }

        showAlert()
        return ["T", "H", "E", " ", "E", "N", "D"]
    }
    
    func chooseNewLetters() -> [String] {
        lettersChosen = []
        lettersChosen = pullLettersFromBag(numberOfTiles: tilesNeeded)
        return lettersChosen
    }
    
    func setUpDictionary() -> [String] {
        var dictWords = [String]()
        
        let resourcePath = Bundle.main.resourcePath! as NSString
        let fileName = "dictionary.txt"
        let filePath = resourcePath.appendingPathComponent(fileName)
        
        var data: String?
        do {
            data = try String(contentsOfFile: filePath, encoding: .utf8)
        } catch let error {
            print(error.localizedDescription)
        }
        
        dictWords = data!.components(separatedBy: .whitespacesAndNewlines)
        
        for word in dictWords {
            trie.insert(word: word)
        }
        return ["no matching words"]
    }
    
    func findWords() -> [String] {
        var lettersArray = [Character]()
    
        for letter in lettersChosen {
            lettersArray.append(letter.first!)
        }
        
        var results = Set<String>()

        trie.findWordsFromLettersArray(&lettersArray, start: 0, end: lettersArray.count - 1, results: &results)

        return Array<String>(results)
    }
    
    func addWordPoints(wordArray: [String]) -> Int {
        var valueArray = [Int]()
        
        for letter in wordArray {
            valueArray.append(Tile.init(letter: letter).tileValue!)
        }
        let totalSum = valueArray.reduce(0, +)
        return totalSum
    }
    
    func startOver() {
        self.bagOfRemainingLetters = self.bagOfLetters
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Game Over", message: "You are out of tiles.  Refresh to get a new bag of tiles.", preferredStyle: .alert)
          
        alert.addAction(UIAlertAction(title: "Start Over", style: .default, handler: { action in
            self.startOver()
        }))
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController as UIViewController? {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
