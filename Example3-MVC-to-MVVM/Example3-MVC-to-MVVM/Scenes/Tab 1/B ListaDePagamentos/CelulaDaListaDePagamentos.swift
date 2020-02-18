//
//  CelulaDaListaDePagamentos.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CelulaDaListaDePagamentos: UITableViewCell {

  // MARK: - Properties
  lazy var beneficiarioLabel: UILabel = { return UILabel(frame: .zero) }()
  lazy var valorAPagarLabel: UILabel = { return UILabel(frame: .zero) }()
  
  var tipoDePagamento: TipoDePagamento?

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

extension CelulaDaListaDePagamentos: ViewCodeProtocol {

  func buildViewHierarchy() {
    contentView.addSubview(beneficiarioLabel)
    contentView.addSubview(valorAPagarLabel)
  }
  
  func setupConstraints() {

        beneficiarioLabel.translatesAutoresizingMaskIntoConstraints = false
        valorAPagarLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

          beneficiarioLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
          beneficiarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
          beneficiarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0),
    
          valorAPagarLabel.topAnchor.constraint(equalTo: beneficiarioLabel.bottomAnchor, constant: 8),
          valorAPagarLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0),
          valorAPagarLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
          valorAPagarLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0)
    
        ])
    
  }
  
  func setupComplementaryConfiguration() {
   
    beneficiarioLabel.font = UIFont.CustomStyle.helveticaNeueBold_14
    beneficiarioLabel.textColor = UIColor.CustomStyle.darkGray
    beneficiarioLabel.numberOfLines = 0
    beneficiarioLabel.adjustsFontForContentSizeCategory = true
    
    valorAPagarLabel.font = UIFont.CustomStyle.helveticaNeue_20
    valorAPagarLabel.textColor = UIColor.CustomStyle.orange
    
  }
  
}




