//
//  ViewModelQuantidadeDePagamentos.swift
//  Example3-MVC-to-MVVM
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewModelQuantidadeDePagamentos {
  
  // MARK: Properties
  let tipoDePagamento: TipoDePagamento
  let quantidadeTotal: Int
  let valorTotal: Double
  
  // MARK: Initializers
  public init(tipoDePagamento: TipoDePagamento, quantidadeTotal: Int, valorTotal: Double) {
    self.tipoDePagamento = tipoDePagamento
    self.quantidadeTotal = quantidadeTotal
    self.valorTotal = valorTotal
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
    return makeAttributedStringToPaymentLabel(withNumberOfPayments: quantidadeTotal, andTipoDePagamento: tipoDePagamento)
  }
  
  var valorAttributedString: NSMutableAttributedString! {
    return convertDoubleToStringAsRealBrasileiro(valorTotal)
  }

  func makeAttributedStringToPaymentLabel(withNumberOfPayments: Int, andTipoDePagamento: TipoDePagamento) -> NSMutableAttributedString {
    
    let attributes_black_bold:  [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.black, .font: bold]
    let attributes_gray_normal: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.gray, .font: normal]
    let attributes_gray_bold:   [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.gray, .font: bold]
    
    let subString1 = NSMutableAttributedString(string: "\(quantidadeTotal) ", attributes: attributes_black_bold)
    let subString2 = NSMutableAttributedString(string: "pagamentos ",                attributes: attributes_gray_normal)
    let subString3 = NSMutableAttributedString(string: tipoDePagamento.rawValue,     attributes: attributes_gray_bold)
    
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



