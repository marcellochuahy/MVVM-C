//
//  CentralDePagamentos.swift
//  Example1-MVC
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CentralDePagamentos: UITableViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var labelPagamentosAVencerQtd: UILabel!
  @IBOutlet weak var labelPagamentosAVencerTotalAPagar: UILabel!
  
  @IBOutlet weak var labelPagamentosVencidosQtd: UILabel!
  @IBOutlet weak var labelPagamentosVencidosTotalAPagar: UILabel!
  
  @IBOutlet weak var labelPagamentosExcluidosQtd: UILabel!
  @IBOutlet weak var labelPagamentosExcluidosTotalAPagar: UILabel!
  
  // MARK: - Properties
  var pagamentosAgrupadosPorTipo = PagamentosAgrupadosPorTipo()
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  // MARK: - Methods
  func loadData() {
    
    guard let url = Bundle.main.url(forResource: "webServicePagamentos", withExtension: "json") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let data = data {
        
        do {
          
          let json = try JSONDecoder().decode(WebServiceDecoder.self, from: data)
          
          let statusCode = json.statusCode
          
          if statusCode == 200 {
            self.pagamentosAgrupadosPorTipo.pagamentosAVencer   = json.pagamentosAVencer
            self.pagamentosAgrupadosPorTipo.pagamentosVencidos  = json.pagamentosVencidos
            self.pagamentosAgrupadosPorTipo.pagamentosExcluidos = json.pagamentosExcluidos
          } else {
            print("Error to conect API 😤")
          }
          
          DispatchQueue.main.async { [weak self] in
            
            self?.labelPagamentosAVencerQtd.text           =    "\(json.pagamentosAVencerQtdTotal) pagamentos a vencer"
            self?.labelPagamentosAVencerTotalAPagar.text   = "R$ \(json.pagamentosAVencerTotalAPagar)"
            
            self?.labelPagamentosVencidosQtd.text          =    "\(json.pagamentosVencidosQtdTotal) pagamentos vencidos"
            self?.labelPagamentosVencidosTotalAPagar.text  = "R$ \(json.pagamentosVencidosTotalAPagar)"
            
            self?.labelPagamentosExcluidosQtd.text         =    "\(json.pagamentosExcluidosQtdTotal) pagamentos excluídos"
            self?.labelPagamentosExcluidosTotalAPagar.text = "R$ \(json.pagamentosExcluidosTotalAPagar)"
          
          }
          
        } catch let error {
          print(error)
        }
        
      }
      
    }.resume()
    
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let destinationViewController = segue.destination as? ListaDePagamentos {
      
      switch segue.identifier {
        
      case "SegueApartirDaCelulaPagamentosAVencer":
        destinationViewController.tipoDePagamento    = .pagamentosAVencer
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosAVencer
        
      case "SegueApartirDaCelulaPagamentosVencidos":
        destinationViewController.tipoDePagamento    = .pagamentosVencidos
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosVencidos
        
      case "SegueApartirDaCelulaPagamentosExcluidos":
        destinationViewController.tipoDePagamento    = .pagamentosExcluidos
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosExcluidos
        
      default: break
        
      }
      
    }
    
  }
  
}
