//
//  ViewModelCurrency.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 27/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewModelCurrency {
  
  // MARK: Properties
  let monetaryValue: Double
  
  // MARK: Initializers
  public init(monetaryValue: Double) {
    self.monetaryValue = monetaryValue
  }
  
  // MARK: Computed properties
  
  var size: CGFloat {
    return 14
  }
  
  var bold: UIFont {
    return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
  }
  
  var normal: UIFont {
    return UIFont(name: "HelveticaNeue-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  var valorAttributedString: NSMutableAttributedString! {
    return convertDoubleToStringAsRealBrasileiro(monetaryValue)
  }

  func convertDoubleToStringAsRealBrasileiro(_ value: Double?) -> NSMutableAttributedString {
    
    var size: CGFloat  { return 20 }
    var normal: UIFont { return UIFont(name: "HelveticaNeue-Regular", size: size) ?? UIFont.systemFont(ofSize: size)}
    let attributes_orange_normal: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.orange, .font: normal]
    
    guard let value = value else { return NSMutableAttributedString(string: "0,00", attributes: attributes_orange_normal) }
    
    let formatter = NumberFormatter()
    formatter.locale =  Locale(identifier: "pt_BR")
    formatter.numberStyle = .currency
    formatter.currencySymbol = "R$"
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    
    let string = formatter.string(from: NSNumber(value: value)) ?? "0,00"
    
    return NSMutableAttributedString(string: string, attributes: attributes_orange_normal)
    
  }
  
}
