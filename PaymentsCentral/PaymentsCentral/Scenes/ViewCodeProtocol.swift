//
//  ViewCodeProtocol.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

protocol ViewCodeProtocol: class {
  
  func buildViewHierarchy()
  func setupConstraints()
  func setupComplementaryConfiguration()
  
  func callsViewCodeMethodsInPreSetOrder()
  
}

extension ViewCodeProtocol {
  
  func callsViewCodeMethodsInPreSetOrder() {
    buildViewHierarchy()
    setupConstraints()
    setupComplementaryConfiguration()
  }
  
}
