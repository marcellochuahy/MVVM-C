//
//  ViewModelNumberOfPayments.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewModelNumberOfPayments {
  
  // MARK: Properties
  private let TypeOfPayment: TypeOfPayment
  let numberOfPayments: Int
  
  // MARK: Initializers
  public init(TypeOfPayment: TypeOfPayment, numberOfPayments: Int) {
    self.TypeOfPayment = TypeOfPayment
    self.numberOfPayments = numberOfPayments
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
  
}



