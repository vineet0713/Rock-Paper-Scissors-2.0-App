//
//  ResultsViewController.swift
//  Rock Paper Scissors 2.0
//
//  Created by Vineet Joshi on 1/17/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import UIKit



// MARK: Declare constants
let WIN = "You Win 😎 ✌️"
let LOSE = "You Lose 😢 👎"
let TIE = "It's A Tie 😶 🤝"

let MOVE_DICT = ["rockpaper":("Paper Covers Rock", LOSE), "paperrock":("Paper Covers Rock", WIN),
                 "scissorsrock":("Rock Crushes Scissors", LOSE), "rockscissors":("Rock Crushes Scissors", WIN),
                 "paperscissors":("Scissors Cut Paper", LOSE), "scissorspaper":("Scissors Cut Paper", WIN)]



class ResultsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: Class variables
    var playerMove: String?
    var cpuMove: String?
    
    
    
    // MARK: Overriden functions from UIViewController
    override func viewWillAppear(_ animated: Bool) {
        if playerMove == cpuMove {
            resultImageView.image = UIImage(named: "ItsATie")
            resultLabel.text = TIE
        } else {
            let message = MOVE_DICT[playerMove! + cpuMove!]!.0
            resultImageView.image = UIImage(named: message.replacingOccurrences(of: " ", with: ""))
            resultLabel.numberOfLines = 3
            resultLabel.text = message + ".\n\n" + MOVE_DICT[playerMove! + cpuMove!]!.1
        }
    }
    
    
    
    // MARK: Navigation
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
