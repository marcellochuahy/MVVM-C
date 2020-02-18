//
//  CelulaDoComprovanteDePagamento.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//
import UIKit

class CelulaDoComprovanteDePagamento: UITableViewCell {
  
  // MARK: - Properties
  
  lazy var boletoBancarioLabel: UILabel      = { return UILabel(frame: .zero) }()
  lazy var valorAPagarLabel: UILabel         = { return UILabel(frame: .zero) }() // recebe dado da tela anterior
  lazy var divider: UIView                   = { return UIView(frame: .zero) }()
  lazy var dadosDoBeneficiarioLabel: UILabel = { return UILabel(frame: .zero) }()
  lazy var nomeLabel: UILabel                = { return UILabel(frame: .zero) }()
  lazy var beneficiarioLabel: UILabel        = { return UILabel(frame: .zero) }() // recebe dado da tela anterior
  
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

extension CelulaDoComprovanteDePagamento: ViewCodeProtocol {
  
  func buildViewHierarchy() {
    contentView.addSubview(boletoBancarioLabel)
    contentView.addSubview(valorAPagarLabel) // recebe dado da tela
    contentView.addSubview(divider)
    contentView.addSubview(dadosDoBeneficiarioLabel)
    contentView.addSubview(nomeLabel)
    contentView.addSubview(beneficiarioLabel) // recebe dado da tela anterior
  }
  
  func setupConstraints() {
    
    boletoBancarioLabel.translatesAutoresizingMaskIntoConstraints = false
    valorAPagarLabel.translatesAutoresizingMaskIntoConstraints = false // recebe dado da tela anterior
    divider.translatesAutoresizingMaskIntoConstraints = false
    dadosDoBeneficiarioLabel.translatesAutoresizingMaskIntoConstraints = false
    nomeLabel.translatesAutoresizingMaskIntoConstraints = false
    beneficiarioLabel.translatesAutoresizingMaskIntoConstraints = false // recebe dado da tela anterior
    NSLayoutConstraint.activate([
      
      boletoBancarioLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 32),
      boletoBancarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      boletoBancarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      valorAPagarLabel.topAnchor.constraint(equalTo: boletoBancarioLabel.bottomAnchor, constant: 16),
      valorAPagarLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      valorAPagarLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      divider.topAnchor.constraint(equalTo: valorAPagarLabel.bottomAnchor, constant: 32),
      divider.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      divider.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      divider.heightAnchor.constraint(equalToConstant: 1),
      
      dadosDoBeneficiarioLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 32),
      dadosDoBeneficiarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      dadosDoBeneficiarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      nomeLabel.topAnchor.constraint(equalTo: dadosDoBeneficiarioLabel.bottomAnchor, constant: 16),
      nomeLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      nomeLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      
      beneficiarioLabel.topAnchor.constraint(equalTo: nomeLabel.bottomAnchor, constant: 16),
      beneficiarioLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
      beneficiarioLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
      beneficiarioLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -32)
      
    ])
    
    boletoBancarioLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
    valorAPagarLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
    divider.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .vertical)
    dadosDoBeneficiarioLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 253), for: .vertical)
    nomeLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 254), for: .vertical)
    beneficiarioLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 255), for: .vertical)
    
  }
  
  func setupComplementaryConfiguration() {
    
    boletoBancarioLabel.text = "boleto\nbancário"
    dadosDoBeneficiarioLabel.text = "dados do beneficiário"
    nomeLabel.text = "nome"
    
    boletoBancarioLabel.font      = UIFont.CustomStyle.helveticaNeueBold_18
    valorAPagarLabel.font         = UIFont.CustomStyle.helveticaNeue_20
    dadosDoBeneficiarioLabel.font = UIFont.CustomStyle.helveticaNeueBold_14
    nomeLabel.font                = UIFont.CustomStyle.helveticaNeue_14
    beneficiarioLabel.font        = UIFont.CustomStyle.helveticaNeue_20
    
    boletoBancarioLabel.textColor      = UIColor.CustomStyle.darkGray
    valorAPagarLabel.textColor         = UIColor.CustomStyle.orange
    dadosDoBeneficiarioLabel.textColor = UIColor.CustomStyle.darkGray
    nomeLabel.textColor                = UIColor.CustomStyle.darkGray
    beneficiarioLabel.textColor        = UIColor.CustomStyle.darkGray
    
    boletoBancarioLabel.numberOfLines = 2
    
    divider.backgroundColor = UIColor.CustomStyle.lightGray
    
    setSelfSizingCellsWithDynamicType()
    
  }
  
  func setSelfSizingCellsWithDynamicType() {
    beneficiarioLabel.numberOfLines = 0
    beneficiarioLabel.adjustsFontForContentSizeCategory = true
  }
  
}
