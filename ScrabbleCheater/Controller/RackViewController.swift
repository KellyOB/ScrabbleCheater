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
    //var fontSize : CGFloat = 150.0 // DEFAULT SIZE

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lettersChosen = Scrabble.shared.chooseNewLetters()
}
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lettersChosen.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TileCell", for: indexPath) as? TileCollectionViewCell {
            cell.shadowDecorate()
            
//        cell.tileLetterLabel.adjustFontSizeForDevice()
            
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
        collectionView.reloadData()
    }
    
    @IBAction func cheatButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCheatList", sender: wordsArray)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCheatList" {
            let destinationVC = segue.destination as! CheatListTableViewController
            
            let rackLetters = lettersChosen.joined()
            destinationVC.rackLetters = rackLetters
          
            let wordsArray = Scrabble.shared.findWords()
            destinationVC.wordsArray = wordsArray
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RackViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        // number of columns desired
//        let columns: CGFloat = 1
//
//        // Match spacing below
//        let spacing: CGFloat = 5
//        let totalVerticalSpacing = (columns) * spacing
//        let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / columns
//
//        let size: CGSize = lettersChosen[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
//        return CGSize(width: size.width + 50.0, height: size.width + 50.0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // number of columns desired
        let columns: CGFloat = 1

        // Match spacing below
        //let spacing: CGFloat = 40
        //let totalVerticalSpacing = (columns) * spacing

        //let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / columns
        let itemSize = CGSize(width: collectionView.bounds.height / 10, height: collectionView.bounds.height / 10)

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

