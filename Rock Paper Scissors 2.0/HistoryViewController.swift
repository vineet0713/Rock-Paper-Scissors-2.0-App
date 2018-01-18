//
//  HistoryViewController.swift
//  Rock Paper Scissors 2.0
//
//  Created by Vineet Joshi on 1/17/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import UIKit



// MARK:
let WINNING_MOVES = ["rockscissors", "paperrock", "scissorspaper"]




// conforms to the UITableViewDataSource protocol and UITableViewDelegate protocol
class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Class variables
    var matches: [RPSMatch] = []
    
    
    
    // MARK: IBOutlets
    @IBOutlet weak var matchTableView: UITableView!
    
    
    
    // MARK: UITableViewDataSource protocol functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell") as! MatchTableViewCell
        let playerMove = self.matches[indexPath.row].playerMove
        let cpuMove = self.matches[indexPath.row].cpuMove
        
        cell.playerImageView.image = UIImage(named: playerMove)
        cell.cpuImageView.image = UIImage(named: cpuMove)
        if playerMove == cpuMove {
            cell.resultLabel.text = "TIE"
            cell.resultLabel.textColor = UIColor.black
        } else if WINNING_MOVES.contains(playerMove + cpuMove) {
            cell.resultLabel.text = "WIN"
            cell.resultLabel.textColor = UIColor.green
        } else {
            cell.resultLabel.text = "LOSS"
            cell.resultLabel.textColor = UIColor.red
        }
        
        return cell
    }
    
    
    
    // MARK: Navigation
    @IBAction func exitHistory(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
