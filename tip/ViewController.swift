//
//  ViewController.swift
//  tip
//
//  Created by Rebecca Shi on 8/24/20.
//  Copyright © 2020 Rebecca Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currencySymbol:String = ""
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencySymbol = Locale.current.currencySymbol ?? ""
        tipLabel.text="\(currencySymbol)0.00"
        totalLabel.text="\(currencySymbol)0.00"
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update the tip and total labels
        tipLabel.text = "\(currencySymbol)\(tip)"
        totalLabel.text = "\(currencySymbol)\(total)"
    }
}
