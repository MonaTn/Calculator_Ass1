//
//  iOS Advance: Assignment 1
//  Calculator
//
//  Created by Mona Torabian on 2017-01-17.
//  Copyright © 2017 Mon Tn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var resultLable: UILabel!
    public         var screenAmount : String = ""
    public         var dotFlag : Bool = false
    public         var operatorType : String = ""
    public         var operant1 : String = ""
    public         var operant2 : String = ""
    public         var result : Double = 0
    public         var newNumber : Bool = false

    
   // All Cleare or Cleare
    @IBAction func trunScreenAmountToZero(_ sender: UIButton) {
        
        if clearButton.currentTitle == "C" {
            // All cleare
            clearButton.setTitle("AC", for: .normal)
            dotFlag = false
        } else {
            resetEverything()
        }
        resultLable.text = "0"
    }
    
     
    // Changing the number on screen to a plus or negative
    @IBAction func inverseSign(_ sender: UIButton) {

        screenAmount = resultLable.text!
        if screenAmount.range(of: "-") != nil  {
            screenAmount.remove(at: screenAmount.startIndex)
        } else {
            screenAmount.insert("-", at:screenAmount.startIndex )
        }
        resultLable.text = screenAmount
    }
    
    // Dot button touched
    @IBAction func dotButtonTouched(_ sender: UIButton) {
        
        if (dotFlag == false) {
            resultLable.text?.insert(".", at: (resultLable.text?.endIndex)!)
            dotFlag = true
        } else {
            return
        }
    }
    
    // Number touched
    @IBAction func numberTouched(_ sender: UIButton) {
        
        clearButton.setTitle ("C", for : .normal)
        screenAmount = resultLable.text!
        if (screenAmount == "0" || newNumber == true){
            screenAmount = ""
            newNumber = false
        } else if (screenAmount == "-0") {
            screenAmount = "-"
        } else {
            // adjusting the font size of a number (Maximum 9 digits)
            if (screenAmount.characters.count>6 && screenAmount.characters.count<9 ) {
                resultLable.adjustsFontSizeToFitWidth = true
            } else if (screenAmount.characters.count>=9) {
                return
            }
        }
       screenAmount += sender.currentTitle!
       resultLable.text = screenAmount
    }
    
    // If an operator is clicked
    @IBAction func operatorTouched(_ sender: UIButton) {
        if (operant1 == "" && operant2 == "") {
            operant1 = resultLable.text!
            newNumber = true
            dotFlag = false
        } else if (operant1 != "" && operant2 == "") {
            execution()
            operant1 = String (result)
            result = 0
        }
        operatorType = sender.currentTitle!
    }
    
    // Different operators
    func doOperation (operatorType : String, operant1 : String, operant2 : String) -> Double {
        switch operatorType {
        case "+": // Addition
            return Double(operant1)! + Double(operant2)!
        case "-": // Subtraction
            return Double(operant1)! - Double(operant2)!
        case "/": // Division
            return Double(operant1)! / Double(operant2)!
        case "X": // Multiplication
            return Double(operant1)! * Double(operant2)!
         default:
            return 0
         }
    }
    
    func execution () {
        operant2 = resultLable.text!
        result = doOperation(operatorType: operatorType, operant1: operant1, operant2: operant2)
        resultLable.text = String (round (value: result, toNearest: 100000))
        newNumber = true
        dotFlag = false
        operant2 = ""
    }
    
    // Cliking the AC button
    func resetEverything () {
        newNumber = true
        dotFlag = false
        operatorType = ""
        operant1 = ""
        operant2 = ""
        result = 0
    }
    
    // Cliking equal button
    @IBAction func equalTouched(_ sender: UIButton) {
        execution()
        operant1 = String (result)
        result = 0
    }
    
    // Cliking percentage button
    @IBAction func percentage(_ sender: UIButton) {
        if (operant1 != "") {
            if (operant2 == "") {
                operant2 = "1"
            }
            operant2 = resultLable.text!
            result = (Double(operant1)! * Double (operant2)!)/100
            newNumber = true
            dotFlag = false
            operant2 = ""
            resultLable.text = String (result)
            result = 0
            
        }
    }
    
    // Round a Double
    func round (value : Double, toNearest : Double) -> Double{
        return floor (value * toNearest)/toNearest
    }

    
}

