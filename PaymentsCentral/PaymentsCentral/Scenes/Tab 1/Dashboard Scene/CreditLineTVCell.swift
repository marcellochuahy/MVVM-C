//
//  CreditLineTVCell.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 24/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol ChildCoordinatorButtonDelegate: class {
  func startButtonANavigation()
  func startButtonBNavigation()
  func startButtonCNavigation()
}

class ChildCoordinatorButtonTVCell: UITableViewCell {
  
  weak var delegate: ChildCoordinatorButtonDelegate?
  
  private lazy var stackView: UIStackView = { return UIStackView(frame: .zero) }()
  private lazy var buttonA: UIButton = { return UIButton(frame: .zero)}()
  private lazy var buttonB: UIButton = { return UIButton(frame: .zero)}()
  private lazy var buttonC: UIButton = { return UIButton(frame: .zero)}()
  
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

extension ChildCoordinatorButtonTVCell: ViewCodeProtocol {
  
  func buildViewHierarchy() {
    
    stackView.addArrangedSubview(buttonA)
    stackView.addArrangedSubview(buttonB)
    stackView.addArrangedSubview(buttonC)
    
    contentView.addSubview(stackView)
    
  }
  
  func setupConstraints() {
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    buttonA.translatesAutoresizingMaskIntoConstraints = false
    buttonB.translatesAutoresizingMaskIntoConstraints = false
    buttonC.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
    ])
    
  }
  
  func setupComplementaryConfiguration() {
    
    contentView.backgroundColor = UIColor.CustomStyle.backgroundGray
    
    stackView.axis = NSLayoutConstraint.Axis.horizontal
    stackView.alignment = UIStackView.Alignment.fill
    stackView.distribution = UIStackView.Distribution.fillEqually
    stackView.spacing = 16
    

    buttonA.setTitle("A", for: .normal)
    buttonA.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
    buttonA.setTitleColor(UIColor.CustomStyle.darkGray, for: .normal)
    buttonA.backgroundColor = UIColor.CustomStyle.white
    buttonA.layer.cornerRadius = 4
    buttonA.addTarget(self, action: #selector(buttonAWasTapped(_:)), for: .touchUpInside)

    buttonB.setTitle("B", for: .normal)
    buttonB.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
    buttonB.setTitleColor(UIColor.CustomStyle.darkGray, for: .normal)
    buttonB.backgroundColor = UIColor.CustomStyle.white
    buttonB.layer.cornerRadius = 4
    buttonB.addTarget(self, action: #selector(buttonBWasTapped(_:)), for: .touchUpInside)
    
    buttonC.setTitle("C", for: .normal)
    buttonC.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
    buttonC.setTitleColor(UIColor.CustomStyle.darkGray, for: .normal)
    buttonC.backgroundColor = UIColor.CustomStyle.white
    buttonC.layer.cornerRadius = 4
    buttonC.addTarget(self, action: #selector(buttonCWasTapped(_:)), for: .touchUpInside)
    
  }
  
  @objc func buttonAWasTapped(_ sender: Any) { delegate?.startButtonANavigation() }
  @objc func buttonBWasTapped(_ sender: Any) { delegate?.startButtonBNavigation() }
  @objc func buttonCWasTapped(_ sender: Any) { delegate?.startButtonCNavigation() }
  
}




