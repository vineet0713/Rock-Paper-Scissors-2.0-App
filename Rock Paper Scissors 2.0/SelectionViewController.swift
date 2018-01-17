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
    
    
    
    // MARK: Navigation
    @IBAction func makeMove(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        self.playerMove = TAG_TO_MOVE_DICT[tag]
        performSegue(withIdentifier: "ShowResultSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ResultsViewController {
            destinationVC.playerMove = self.playerMove
            destinationVC.cpuMove = TAG_TO_MOVE_DICT[generateRandomMove()]
        }
    }
    
}

