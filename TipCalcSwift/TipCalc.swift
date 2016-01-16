//
//  TipCalc.swift
//  TipCalcSwift
//
//  Created by Brian Moakley on 11/5/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation

class TipCalc {
  
  var tipAmount: Float = 0
  var amountBeforeTax: Float = 0
  var tipPercentage: Float = 0
  
  init(amountBeforeTax:Float, tipPercentage:Float) {
    self.amountBeforeTax = amountBeforeTax
    self.tipPercentage = tipPercentage
  }
  
  func calculateTip() {
    tipAmount = amountBeforeTax * tipPercentage
  }
  
}
