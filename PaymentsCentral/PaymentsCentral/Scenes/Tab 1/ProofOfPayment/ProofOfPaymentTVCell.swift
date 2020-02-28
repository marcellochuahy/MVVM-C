//
//  CelulaDoComprovanteDePagamento.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ProofOfPaymentTVCell: UITableViewCell {
  
  // MARK: - Properties
  
  lazy var boletoBancarioLabel: UILabel      = { return UILabel(frame: .zero) }()
  lazy var dadosDoBeneficiarioLabel: UILabel = { return UILabel(frame: .zero) }()
  lazy var nomeLabel: UILabel                = { return UILabel(frame: .zero) }()
  
  lazy var monetaryValueLabel: UILabel       = { return UILabel(frame: .zero) }()
  lazy var divider: UIView                   = { return UIView(frame: .zero) }()
  lazy var beneficiaryLabel: UILabel         = { return UILabel(frame: .zero) }()
  
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

extension ProofOfPaymentTVCell: ViewCodeProtocol {
  
  func buildViewHierarchy() {
    contentView.addSubview(boletoBancarioLabel)
    contentView.addSubview(monetaryValueLabel)
    contentView.addSubview(divider)
    contentView.addSubview(dadosDoBeneficiarioLabel)
    contentView.addSubview(nomeLabel)
    contentView.addSubview(beneficiaryLabel)
  }
  
  func setupConstraints() {
    
    boletoBancarioLabel.translatesAutoresizingMaskIntoConstraints = false
    monetaryValueLabel.translatesAutoresizingMaskIntoConstraints = false
    divider.translatesAutoresizingMaskIntoConstraints = false
    dadosDoBeneficiarioLabel.translatesAutoresizingMaskIntoConstraints = false
    nomeLabel.translatesAutoresizingMaskIntoConstraints = false
    beneficiaryLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      boletoBancarioLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 32),
      boletoBancarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      boletoBancarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      monetaryValueLabel.topAnchor.constraint(equalTo: boletoBancarioLabel.bottomAnchor, constant: 16),
      monetaryValueLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      monetaryValueLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      divider.topAnchor.constraint(equalTo: monetaryValueLabel.bottomAnchor, constant: 32),
      divider.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      divider.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      divider.heightAnchor.constraint(equalToConstant: 1),
      
      dadosDoBeneficiarioLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 32),
      dadosDoBeneficiarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      dadosDoBeneficiarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      nomeLabel.topAnchor.constraint(equalTo: dadosDoBeneficiarioLabel.bottomAnchor, constant: 16),
      nomeLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      nomeLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      beneficiaryLabel.topAnchor.constraint(equalTo: nomeLabel.bottomAnchor, constant: 16),
      beneficiaryLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      beneficiaryLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      beneficiaryLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -32)
      
    ])
    
    boletoBancarioLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
    monetaryValueLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
    divider.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .vertical)
    dadosDoBeneficiarioLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 253), for: .vertical)
    nomeLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 254), for: .vertical)
    beneficiaryLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 255), for: .vertical)
    
  }
  
  func setupComplementaryConfiguration() {
    
    boletoBancarioLabel.text = "boleto\nbancário"
    dadosDoBeneficiarioLabel.text = "dados do beneficiário"
    nomeLabel.text = "nome"
    
    boletoBancarioLabel.font      = UIFont.CustomStyle.helveticaNeueBold_18
    monetaryValueLabel.font       = UIFont.CustomStyle.helveticaNeue_20
    dadosDoBeneficiarioLabel.font = UIFont.CustomStyle.helveticaNeueBold_14
    nomeLabel.font                = UIFont.CustomStyle.helveticaNeue_14
    beneficiaryLabel.font         = UIFont.CustomStyle.helveticaNeue_20
    
    boletoBancarioLabel.textColor      = UIColor.CustomStyle.darkGray
    monetaryValueLabel.textColor       = UIColor.CustomStyle.orange
    dadosDoBeneficiarioLabel.textColor = UIColor.CustomStyle.darkGray
    nomeLabel.textColor                = UIColor.CustomStyle.darkGray
    beneficiaryLabel.textColor         = UIColor.CustomStyle.darkGray
    
    boletoBancarioLabel.numberOfLines = 2
    
    divider.backgroundColor = UIColor.CustomStyle.lightGray

  }

}
