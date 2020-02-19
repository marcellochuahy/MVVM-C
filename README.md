MVVM-C
=======

Esse tutorial se inicia a partir de um mini projeto em MVC com Storyboard, e aborda os seguintes assuntos:

Self Sizing Table View Cells
--------------------------------
Como tornar as UITableViewCells responsivas ao seu contéudo interno, permitindo inclusive o redimensionamento de textos em benefício da acessibilidade ao usuário.

Exemplo:

Na tela **central de pagamentos**,  no primeiro botão (pagamentos a vencer).

![setSelfSizingTableViewCells_1](https://user-images.githubusercontent.com/17011151/74830794-aca0bd00-52f2-11ea-8a31-6aeb23131805.png)

Na próxima tela você verá que a segunda célula não suporta o seu conteúdo:

![setSelfSizingTableViewCells_2](https://user-images.githubusercontent.com/17011151/74830816-b62a2500-52f2-11ea-9778-eb2229a5f4fd.png)

Para corrigir isso basta acrescentar 3 linhas no código da classe **PaymentsListTableViewController**:

linha26 | tableView.rowHeight = UITableView.automaticDimension
linha27 | tableView.estimatedRowHeight = 80 // estimated row height for 1 line

linha56 | cell.textLabel?.numberOfLines = 0 // <- zero means multiline in this context

```
...

linha 09 | import UIKit
linha 10 | 
linha 11 | class PaymentsListTableViewController: UITableViewController {

...

linha 17 | // MARK: - Life cycle
linha 18 | override func viewDidLoad() {
linha 19 |   super.viewDidLoad()
linha 20 |   title = typeOfPayment?.rawValue
linha 21 |   setSelfSizingTableViewCells()
linha 22 | }
linha 23 |
linha 24 | // MARK: - Methods
linha 25 | func setSelfSizingTableViewCells() {
----> 26 |   tableView.rowHeight = UITableView.automaticDimension
----> 27 |   tableView.estimatedRowHeight = 80
linha 28 | }
linha 29 |
linha 30 | // MARK: - Table view data source

...

linha 46 | override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
linha 47 | 
linha 48 | let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsListTableViewCell", for: indexPath) as! linha 46 | PaymentsListTableViewCell
linha 49 | 
linha 50 | guard let key = paymentsDataSource?[indexPath.section]?.keys.first else { return cell }
linha 51 | 
linha 52 | let payments = paymentsDataSource?[indexPath.section]?[key]
linha 53 | let beneficiary = payments?[indexPath.row].beneficiary
linha 54 | let monetaryValueToPay = payments?[indexPath.row].monetaryValueToPay ?? 0
linha 55 | 
----> 56 | cell.beneficiaryLabel.numberOfLines = 0 // <- zero means multiline in this context
linha 57 | cell.beneficiaryLabel.text = beneficiary
linha 58 | cell.monetaryValueToPay.text = "\(monetaryValueToPay)"
linha 59 | 
linha 60 | return cell
linha 61 | }

...

```

Além disso, o conteúdo interno das UITableViewCell (ex: labels) devem ter suas constraints "top" e "bottom" conectadas aos limites superior e inferior das suas UITableViewCell. Isso é necessário para que o conteúdo interno "empurre" ou "encolha" as celulas onde se encontram.

O exemplo abaixo mostra o uso de constraints com View Code.

```
func setupConstraints() {

label.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([

label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 8),
label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -8),
label.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -8)

])

}
```

O resultado é esse:

![setSelfSizingTableViewCells_1](https://user-images.githubusercontent.com/17011151/74830794-aca0bd00-52f2-11ea-8a31-6aeb23131805.png)

![setSelfSizingTableViewCells_3](https://user-images.githubusercontent.com/17011151/74830830-bc200600-52f2-11ea-8891-ad0a0c3a9b96.png)


View Code
--------------------------------
Abandonar o StoryBoard permite agilizar o desenvolvimento a partir da utilização de snippets e técnicas de componentização, além de reduz os conflitos de merge.

MVVM
--------------------------------
Model View View-Model é uma evolução natural do MVC. Ele utiliza um componente adcional (a View-Model) que se responsabiliza pela manipulação dos dados "brutos" gerados pela Model. Isso retira do View-Controller responsabilidades que não deveriam estar relacionadas a este, evitando códigos gigantes por vezes encontrados nos View Controllers ( pejorativamente chamados "MVC - Massive View Controllers").

Coordinator
--------------------------------
Coordinator retira dos View Controllers a responsabilidade sobre a navegação entre telas

Alteração da versão de desenvolvimento
--------------------------------
Esse mini projeto foi inicialmente desenvolvido para iOS 13.2. Para fins de aumentar a cobertura de uso dos clientes, o projeto será alterado para a iOS 10.4.


---
[comment]: <> Images:
[comment]: <> New issue
[comment]: <> https://guides.github.com/features/mastering-markdown/



