# MVVM-C

Esse exemplo utiliza iOS 12.0 e Swift 4.2 e aborda os seguintes assuntos:

- Self Sizing Cell
- MVVM
- Coordinator

## Fluxo de telas

![Captura de Tela 2020-02-28 às 09 28 38](https://user-images.githubusercontent.com/17011151/75549016-6d1e5300-5a0d-11ea-9df1-4fa80939dc8a.png)

O exemplo utiliza um Tab Bar Controller com 2 itens: **Tab 1** e **Tab 2**

### Tab 1

Tab 1 contêm um main coordinator que é responsável pelo fluxo de 3 telas: **central de pagamentos**, **lista de pagamentos** e **comprovante**.

Esse coordinator utiliza um array de View Controllers para exemplificar como um mesmo View Controller pode ser reaproveitado para exibir conteúdo distinto (fluxo azul):

```
 private lazy var paymentListTVCs = [
    PaymentListTVC.instantiate(coordinator: self, title: "pagamentos " + TypeOfPayment.duePayment.rawValue, paymentsDataSource: paymentsGroupedByType.duePayment),
    PaymentListTVC.instantiate(coordinator: self, title: "pagamentos " + TypeOfPayment.overduePayment.rawValue, paymentsDataSource: paymentsGroupedByType.overduePayment),
    PaymentListTVC.instantiate(coordinator: self, title: "pagamentos " + TypeOfPayment.excludedPayment.rawValue, paymentsDataSource: paymentsGroupedByType.excludedPayment)
  ]
```

Além disso, 3 **child coordinators** foram criados para demonstrar a utilização de navegações ramificadas a partir do main coordinator (fluxo roxo). Child coordinators podem ser utilizados para projetos mais complexos. Nesse exemplo cada child coordinator se encarrega de exibir um unico View Controller A, B ou C conforme o caso.

### Tab 2

Tab 2 é apenas uma View com um único label com label.text = "Em branco".

## Self Sizing Cell

Self Sizing Cell se relaciona a acessibilidade permitino o redimencionamento das células conforme seu contéudo, permitindo o ajuste do tamanho da fonte pelo usuário.

Sua implementação requer 4 linhas de código:



```
// PaymentListTVC.swift

  func setupTableView() {
    /// ⚠️ uncomment to enable self sizing cell
    // tableView.rowHeight = UITableView.automaticDimension
    // tableView.estimatedRowHeight = 80
    tableView.backgroundColor = UIColor.CustomStyle.white
    tableView.register(PaymentListTVCell.self, forCellReuseIdentifier: "cell")
  }


