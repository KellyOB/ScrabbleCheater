//
//  Scrabble.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/15/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

struct Scrabble {
    
    static var shared = Scrabble()
    var trie = Trie()
    
    var bagOfLetters: [String] = ["a", "a","a","a","a","a","a","a","a","b","b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
    
    var tilesNeeded = 7
    var lettersChosen = [String]()
    var wordsArray = [String]()
    
    init() {
        print("4a.  set up dictionary got called from init")
        setUpDictionary()
    }
    
    mutating func pullLettersFromBag(numberOfTiles: Int) -> [String] {
        while bagOfLetters.count > 7 {
            for _ in 0..<numberOfTiles {
                let randomLetter = Int.random(in: 0...bagOfLetters.count - 1)
                lettersChosen.append(bagOfLetters[randomLetter])
                bagOfLetters.remove(at: randomLetter)
            }
            return lettersChosen
        }
        // add UIAlert for Game Over and a replay button.
        return ["T", "H", "E", " ", "E", "N", "D"]
    }
    

    mutating func chooseNewLetters() -> [String] {
        lettersChosen = []
        lettersChosen = pullLettersFromBag(numberOfTiles: tilesNeeded)
        return lettersChosen
    }
    
    func setUpDictionary() -> [String] {

       print("4b. from setUpDictionary func called from init")
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
    
    
    mutating func makeWordsArray() {
        let results = findWords()

        print("printing results from makeWordsArray func \(results)")
        wordsArray = results
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
}
