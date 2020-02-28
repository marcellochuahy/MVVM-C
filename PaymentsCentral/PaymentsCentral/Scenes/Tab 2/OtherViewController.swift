//
//  OtherViewController.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 17/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit
// TODO
class OtherViewController: UIViewController {
  
  lazy var label: UILabel = { return UILabel(frame: .zero) }()
  
  override func loadView() {
    setupView()
    callsViewCodeMethodsInPreSetOrder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "root 2" 
  }
  
}

extension OtherViewController: ViewCodeProtocol {
  
  private func setupView() {
    view = UIView(frame: .zero)
    view.backgroundColor = .white
  }
  
  func buildViewHierarchy() {
    view.addSubview(label)
  }
  
  func setupConstraints() {
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
    
  }
  
  func setupComplementaryConfiguration() {
    label.text = "Em branco"
  }
  
}


