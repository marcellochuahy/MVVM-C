//
//  CelulaDaCentralDePagamentos.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 17/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class DashboardTVCell: UITableViewCell {
  
  // MARK: - Properties
  lazy var roundedView: UIView    = { return UIView(frame: .zero) }()
  lazy var leftBarView: UIView    = { return UIView(frame: .zero) }()
  lazy var stackView: UIStackView = { return UIStackView(frame: .zero) }()
  
  lazy var numberOfPayments: UILabel             = { return UILabel(frame: .zero) }()
  lazy var monetaryValueLabel: UILabel           = { return UILabel(frame: .zero) }()
  lazy var disclosureIndicatorImage: UIImageView = { return UIImageView(frame: .zero) }()
  
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

extension DashboardTVCell: ViewCodeProtocol {
  
  func buildViewHierarchy() {
    
    stackView.addArrangedSubview(numberOfPayments)
    stackView.addArrangedSubview(monetaryValueLabel)
    
    roundedView.addSubview(leftBarView)
    roundedView.addSubview(stackView)
    roundedView.addSubview(disclosureIndicatorImage)
    
    contentView.addSubview(roundedView)
    
  }
  
  func setupConstraints() {
    
    roundedView.translatesAutoresizingMaskIntoConstraints = false
    leftBarView.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false
    numberOfPayments.translatesAutoresizingMaskIntoConstraints = false
    monetaryValueLabel.translatesAutoresizingMaskIntoConstraints = false
    disclosureIndicatorImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      leftBarView.topAnchor.constraint(equalTo: roundedView.topAnchor),
      leftBarView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor),
      leftBarView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor),
      leftBarView.widthAnchor.constraint(equalToConstant: 4),
      
      stackView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 17),
      stackView.trailingAnchor.constraint(equalTo: disclosureIndicatorImage.trailingAnchor, constant: -16),
      
      disclosureIndicatorImage.widthAnchor.constraint(equalToConstant: 18),
      disclosureIndicatorImage.heightAnchor.constraint(equalToConstant: 18),
      disclosureIndicatorImage.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -16),
      disclosureIndicatorImage.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor)
      
    ])
    
  }
  
  func setupComplementaryConfiguration() {
    
    // Cores
    contentView.backgroundColor = UIColor.CustomStyle.backgroundGray
    roundedView.backgroundColor = UIColor.CustomStyle.white
    numberOfPayments.textColor = UIColor.CustomStyle.gray
    monetaryValueLabel.textColor = UIColor.CustomStyle.darkGray
    
    // Stack view
    stackView.axis = NSLayoutConstraint.Axis.vertical
    stackView.alignment = UIStackView.Alignment.leading
    stackView.distribution = UIStackView.Distribution.fill
    stackView.spacing = 3
    
    // Fonts
    numberOfPayments.font = UIFont.CustomStyle.helveticaNeue_14
    numberOfPayments.numberOfLines = 1
    numberOfPayments.adjustsFontForContentSizeCategory = false
    
    monetaryValueLabel.font = UIFont.CustomStyle.helveticaNeueBold_24
    monetaryValueLabel.numberOfLines = 1
    monetaryValueLabel.adjustsFontForContentSizeCategory = false
    
    // Outros
    roundedView.layer.cornerRadius = 4
    roundedView.clipsToBounds = true
    
    disclosureIndicatorImage.image = UIImage(named: "disclosureIndicatorImage")
    
  }
  
}





