//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let tipAmount = sender.currentTitle
        //print("\(tipAmount!) gets pressed")
        
        // get the current tittle from the button pressed
        let buttonTittle = sender.currentTitle!
        
        //removeing the last character (%)
        let buttonTitleMinusPercentSign = String(buttonTittle.dropLast())
        
        //turn the string into a double
        let buttonTittleAsNumver = Double(buttonTitleMinusPercentSign)!
        
        // divide the percent expressed out of 100 into a decimal ex: 10 becomes 0.1
        tip = buttonTittleAsNumver / 100
        
    }
    
    
    @IBAction func stepperValueButton(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
        
        
    }
    
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        

        let billText = billTextField.text!
        if billText != ""{
            
            //convertendo a conta de string para uma string decimal
            billTotal = Double(billText)!
            
            
            // multiplicando a conta pelo total de % e dividindo entre o número de pessoas
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
        billTextField.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

