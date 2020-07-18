//
//  CheatListTableViewController.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/16/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

class CheatListTableViewController: UITableViewController {

    var rackLetters = String()
    var wordsArray = [String]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        title = rackLetters
    }

    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        
        let arrayOfLetters = wordsArray[indexPath.row].map{String($0)}
        let valueString = Scrabble.shared.addWordPoints(wordArray: arrayOfLetters)
        
        cell.textLabel!.text = wordsArray[indexPath.row]
        cell.detailTextLabel!.text = String(valueString)
        
        return cell
    }
}
