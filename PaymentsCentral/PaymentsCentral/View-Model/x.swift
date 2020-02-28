//
//  x.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 27/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

/*
import UIKit

class ViewModelNumberOfPayments {
  
  // MARK: Properties
  private let TypeOfPayment: TypeOfPayment
  let numberOfPayments: Int
  let totalMonetaryValue: Double
  
  // MARK: Initializers
  public init(TypeOfPayment: TypeOfPayment, numberOfPayments: Int, totalMonetaryValue: Double) {
    self.TypeOfPayment = TypeOfPayment
    self.numberOfPayments = numberOfPayments
    self.totalMonetaryValue = totalMonetaryValue
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
  
  var quantidadeAttributedString: NSMutableAttributedString! {
    return makeAttributedStringToPaymentLabel(withNumberOfPayments: numberOfPayments, andTipoDePagamento: TypeOfPayment)
  }
  
  var valorAttributedString: NSMutableAttributedString! {
    return convertDoubleToStringAsRealBrasileiro(totalMonetaryValue)
  }
  
  func makeAttributedStringToPaymentLabel(withNumberOfPayments: Int, andTipoDePagamento: TypeOfPayment) -> NSMutableAttributedString {
    
    let attributes_black_bold:  [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.black, .font: bold]
    let attributes_gray_normal: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.gray, .font: normal]
    let attributes_gray_bold:   [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.gray, .font: bold]
    
    let subString1 = NSMutableAttributedString(string: "\(numberOfPayments) ", attributes: attributes_black_bold)
    let subString2 = NSMutableAttributedString(string: "pagamentos ",                attributes: attributes_gray_normal)
    let subString3 = NSMutableAttributedString(string: TypeOfPayment.rawValue,     attributes: attributes_gray_bold)
    
    subString1.append(subString2)
    subString1.append(subString3)
    
    return subString1
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

*/


