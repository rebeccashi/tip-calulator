//
//  ViewController.swift
//  tip
//
//  Created by Rebecca Shi on 8/24/20.
//  Copyright © 2020 Rebecca Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let locale = Locale.current
    var tip = 0.00, total = 0.00
    var formatter = NumberFormatter()
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formatter.locale = locale
        formatter.numberStyle = .currency
        tipLabel.text = formatter.string(from: tip as NSNumber)
        totalLabel.text = formatter.string(from: total as NSNumber)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        //Update the tip and total labels
        tipLabel.text = formatter.string(from: tip as NSNumber)
        totalLabel.text = formatter.string(from: total as NSNumber)
    }
}
