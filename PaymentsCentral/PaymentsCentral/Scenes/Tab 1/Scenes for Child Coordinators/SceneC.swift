//
//  SceneC.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 24/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol SceneCDelegate: class {
  func doSomething()
}

class SceneC: UIViewController {
  
  weak var coordinator: SceneCDelegate?
  
  private lazy var label: UILabel = { return UILabel(frame: .zero) }()
  private lazy var button: UIButton = { return UIButton(frame: .zero)}()
  
  override func loadView() {
    setupView()
    callsViewCodeMethodsInPreSetOrder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

// MARK: - Constructors

extension SceneC {
  public class func instantiate(delegate: SceneCDelegate?) -> SceneC {
    let viewController = SceneC()
    viewController.coordinator = delegate
    viewController.title = "Scene C"
    return viewController
  }
}

extension SceneC: ViewCodeProtocol {
  
  private func setupView() {
    view = UIView(frame: .zero)
    view.backgroundColor = .white
  }
  
  func buildViewHierarchy() {
    view.addSubview(label)
    view.addSubview(button)
  }
  
  func setupConstraints() {
    
    label.translatesAutoresizingMaskIntoConstraints = false
    button.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32)
      
    ])
    
  }
  
  func setupComplementaryConfiguration() {
    
    label.text = "Scene C"
    
    button.setTitle("Do Something", for: .normal)
    button.titleLabel?.font = UIFont.CustomStyle.helveticaNeue_20
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
    
  }
  
  @objc func buttonWasTapped(_ sender: Any) { coordinator?.doSomething() }
  
}



