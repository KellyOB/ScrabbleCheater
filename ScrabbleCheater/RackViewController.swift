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
            return cell
        }
        return UICollectionViewCell()
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        lettersChosen = Scrabble.shared.chooseNewLetters()
        collectionView.reloadData()
    }
    
    @IBAction func cheatButtonPressed(_ sender: Any) {
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
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
