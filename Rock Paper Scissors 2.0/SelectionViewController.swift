//
//  SelectionViewController.swift
//  Rock Paper Scissors 2.0
//
//  Created by Vineet Joshi on 1/17/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeMove(_ sender: Any) {
        performSegue(withIdentifier: "ShowResultSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

