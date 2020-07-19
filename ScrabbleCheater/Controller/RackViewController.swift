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
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            if #available(iOS 11.0, *) {
                flowLayout.sectionInsetReference = .fromSafeArea
            }
        }
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
//        let itemSize = CGSize(width: collectionView.bounds.height / 10, height: collectionView.bounds.height / 10)
//
//        let size: CGSize = lettersChosen[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
//        return CGSize(width: size.width + 50.0, height: size.width + 50.0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        // number of columns desired
//        let columns: CGFloat = 1
//
//        // Match spacing below
//        //let spacing: CGFloat = 40
//        //let totalVerticalSpacing = (columns) * spacing
//
//        //let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / columns
//        let itemSize = CGSize(width: collectionView.bounds.height / 10, height: collectionView.bounds.height / 10)
//
//        return itemSize
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       //collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        //view.sectionInsetReference = .fromSafeArea
       // collectionView.contentInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 30.0, right: 10.0)
        //collectionView.adjustedContentInset = UIEdgeInsets(top: 74.0, left: 10.0, bottom: 59.0, right: 10.0)
        
        let rows: CGFloat = 7
    
        let spacing: CGFloat = 24
    
        let totalVerticalSpacing = (2 * spacing) + ((rows - 1) * spacing)
    
    
        let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / rows
   print(itemHeight)
        let itemSize = CGSize(width: itemHeight, height: itemHeight * 1)
    return itemSize
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // horizontal space between items
        return 300
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // vertical space between items
        return 15
    }
}

