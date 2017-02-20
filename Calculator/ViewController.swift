//
//  ViewController.swift
//  Calculator
//
//  Created by Mona Torabian on 2017-01-17.
//  Copyright © 2017 Mon Tn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultLable: UILabel!
    
   
    @IBAction func clearButton(_ sender: UIButton) {
        resultLable.text = "0"
    }
    
    @IBAction func inverseSign(_ sender: UIButton) {
        
        if resultLable.text?.range(of: "-") != nil {
           resultLable.text?.remove(at: (resultLable.text?.startIndex)!)
        }
    }
    
}

