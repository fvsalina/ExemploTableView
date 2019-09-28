//
//  ViewController.swift
//  ExemploTableView
//
//  Created by Fernando Vernal Salina on 27/09/19.
//  Copyright © 2019 Fernando Vernal Salina. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

   /* var comidas : [String] = ["Lasanha", "Pizza" , "Torta"]
    var imagensComida : [String] = ["lasanha", "pizza", "torta"]
    var descComida : [String] = ["Lasanha Bolonhesa", "Pizza Calabreza", "Torta de Limão"]*/
    var comidas : [Comidas] = [Comidas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comidas.append(Comidas(nome: "Lasanha", imagem: UIImage(named: "lasanha")!, descricao: "Lasanha Bolonhesa"))
        comidas.append(Comidas(nome: "Pizza", imagem: UIImage(named: "pizza")!, descricao: "Pizza Calabreza"))
        comidas.append(Comidas(nome: "Torta", imagem: UIImage(named: "torta")!, descricao: "Torta de Limão"))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comidas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ComidasView
        
        cell.nome.text=comidas[indexPath.row].nome
        //cell.nome=comidas[indexPath.row].nome
        
        cell.descricao.text = comidas[indexPath.row].descricao
        
        cell.imagem.image = comidas[indexPath.row].imagem /*cell.imageView?.image=comidas[indexPath.row].imagem
        
        cell.imageView?.layer.cornerRadius=25
        cell.imageView?.clipsToBounds=true*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alerta = UIAlertController(title: comidas[indexPath.row].nome, message: comidas[indexPath.row].descricao, preferredStyle: .actionSheet)
        
        let alertaControle = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        let alertaControle2 = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alerta.addAction(alertaControle)
        alerta.addAction(alertaControle2)

       present(alerta,animated: true,completion: nil)
        
    }


}

