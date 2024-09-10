//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gustavo Mendonca on 01/09/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% of tip"

        
    }

    @IBAction func recalculatedPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
}
