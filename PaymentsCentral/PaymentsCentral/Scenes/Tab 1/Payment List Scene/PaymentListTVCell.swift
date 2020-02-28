//
//  CelulaDaListaDePagamentos.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class PaymentListTVCell: UITableViewCell {
  
  // MARK: - Properties
  lazy var beneficiaryLabel: UILabel = { return UILabel(frame: .zero) }()
  lazy var monetaryValueLabel: UILabel = { return UILabel(frame: .zero) }()
  
  var TypeOfPayment: TypeOfPayment?
  
  // MARK: - Initialization
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    callsViewCodeMethodsInPreSetOrder()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    callsViewCodeMethodsInPreSetOrder()
  }
  
}

extension PaymentListTVCell: ViewCodeProtocol {
  
  func buildViewHierarchy() {
    contentView.addSubview(beneficiaryLabel)
    contentView.addSubview(monetaryValueLabel)
  }
  
  func setupConstraints() {
    
    beneficiaryLabel.translatesAutoresizingMaskIntoConstraints = false
    monetaryValueLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      beneficiaryLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
      beneficiaryLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
      beneficiaryLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0),
      
      monetaryValueLabel.topAnchor.constraint(equalTo: beneficiaryLabel.bottomAnchor, constant: 8),
      monetaryValueLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0),
      monetaryValueLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
      monetaryValueLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0)
      
    ])
    
  }
  
  func setupComplementaryConfiguration() {
    
    beneficiaryLabel.font = UIFont.CustomStyle.helveticaNeueBold_14
    beneficiaryLabel.textColor = UIColor.CustomStyle.darkGray
    
    monetaryValueLabel.font = UIFont.CustomStyle.helveticaNeue_20
    monetaryValueLabel.textColor = UIColor.CustomStyle.orange
    
  }
  
}




