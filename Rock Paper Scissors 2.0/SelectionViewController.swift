//
//  SelectionViewController.swift
//  Rock Paper Scissors 2.0
//
//  Created by Vineet Joshi on 1/17/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import UIKit



// MARK: Declare constants
let TAG_TO_MOVE_DICT: [Int:String] = [0: "rock", 1: "paper", 2: "scissors"]



// MARK: Global functions
func generateRandomMove() -> Int {
    return Int(arc4random() % 3)
}



class SelectionViewController: UIViewController {
    
    // MARK: Class variables
    var playerMove: String?
    var cpuMove: String?
    var matches: [RPSMatch] = []
    
    
    
    // MARK: Navigation
    @IBAction func makeMove(_ sender: Any) {
        self.playerMove = TAG_TO_MOVE_DICT[(sender as! UIButton).tag]
        self.cpuMove = TAG_TO_MOVE_DICT[generateRandomMove()]
        self.matches.append(RPSMatch(playerMove: self.playerMove!, cpuMove: self.cpuMove!))
        
        performSegue(withIdentifier: "ShowResultSegue", sender: sender)
    }
    
    @IBAction func showHistory(_ sender: Any) {
        performSegue(withIdentifier: "ShowHistorySegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ResultsViewController {
            destinationVC.playerMove = self.playerMove
            destinationVC.cpuMove = self.cpuMove
        } else if let destinationVC = segue.destination as? HistoryViewController {
            destinationVC.matches = self.matches
        }
    }
    
}

