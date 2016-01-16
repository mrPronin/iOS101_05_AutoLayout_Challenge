//
//  ViewController.swift
//  TipCalcSwift
//
//  Created by Brian Moakley on 11/5/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var amountBeforeTaxTextField: UITextField!
  @IBOutlet weak var tipPercentageTextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  let tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
  var textFields: [UITextField]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
    tipPercentageTextField.text = String(format: "%0.2f", arguments: [tipCalc.tipPercentage])
    textFields = [amountBeforeTaxTextField, tipPercentageTextField]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func calcTip() {
    if let tipPercentageText = tipPercentageTextField.text, amountText = amountBeforeTaxTextField.text {
      if let tipPercentage = Float(tipPercentageText), amount = Float(amountText) {
        tipCalc.tipPercentage = tipPercentage
        tipCalc.amountBeforeTax = amount
        tipCalc.calculateTip()
        resultLabel.text = String(format: "Your tip: %0.2f.", arguments: [tipCalc.tipAmount])
      }
    }
  }
  
  @IBAction func buttonTapped(sender: AnyObject!) {
    calcTip()
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    let textFieldArray = textFields as NSArray
    let i = textFieldArray.indexOfObject(textField)
    if i < textFieldArray.count - 1 {
      let newTextField = textFieldArray[i+1] as! UITextField
      newTextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
      calcTip()
    }
    return true
  }
  

}

