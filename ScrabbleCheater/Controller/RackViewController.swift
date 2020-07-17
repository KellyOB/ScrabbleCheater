//
//  RackViewController.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/15/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

class RackViewController: UICollectionViewController {

    var lettersChosen: [String] = []
    var wordsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lettersChosen = Scrabble.shared.chooseNewLetters()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return lettersChosen.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TileCell", for: indexPath) as? TileCollectionViewCell {
            cell.shadowDecorate()
            cell.tileLetterLabel.text = lettersChosen[indexPath.row].uppercased()
            
            if let tile = Tile.init(letter: lettersChosen[indexPath.row]).tileValue {
                 cell.tileValueLabel.text = String(tile)
            } else {
                cell.tileValueLabel.text = "0"
            }

            return cell
        }
        return UICollectionViewCell()
    }
    
    // MARK: IBActions
    @IBAction func refreshButtonPressed(_ sender: Any) {
        lettersChosen = Scrabble.shared.chooseNewLetters()
        print("from refresh button pressed: \(lettersChosen)")
        collectionView.reloadData()
    }
    
    @IBAction func cheatButtonPressed(_ sender: UIButton) {
//        print("5a. triggered when cheat button pressed... calls fidWords func")
//        Scrabble.shared.makeWordsArray()
//        
//        let wordsArray = Scrabble.shared.findWords()
//         print("words array printed when cheat button pressed: \(wordsArray)")
        performSegue(withIdentifier: "toCheatList", sender: wordsArray)
       
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("5a. triggered when prepare to segue... calls fidWords func")
        if segue.identifier == "toCheatList" {
            let destinationVC = segue.destination as! CheatListTableViewController
            let rack = lettersChosen.joined()
            destinationVC.rackLetters = rack
          
            let wordsArray = Scrabble.shared.findWords()
            destinationVC.wordsArray = wordsArray
            print("5aaaa. words array printed from prepare for segue: \(wordsArray)")
            
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RackViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // number of columns desired
        let columns: CGFloat = 1
        
        // Match spacing below
        let spacing: CGFloat = 5
        let totalVerticalSpacing = (columns) * spacing
        
        let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / columns
        let itemSize = CGSize(width: itemHeight / 10, height: itemHeight / 10)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // horizontal space between items
        return 250
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // vertical space between items
        return 15
    }
}
