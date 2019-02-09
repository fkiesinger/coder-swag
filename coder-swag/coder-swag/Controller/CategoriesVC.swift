//
//  ViewController.swift
//  coder-swag
//
//  Created by Finn Kiesinger on 09.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataSource und Delegate werden des TableViews werden festgelegt
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Anzahl an Rows wird festgelegt
        //durch die Anzahl an Kategorien
        //im Array categories der Klasse DataService
        return DataService.instance.getCategories().count
    }
    
    //Durch die oben festgelegte Anzahl n an benötigten Rows wird die Funktion n mal aufgerufen
    //IndexPath.row steigt damit bei jedem aufrufen um eins an, row = n-1 erreicht wurde
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //wiederverwendbare Zelle wird erstellt -> Identifier wurde im Storyboard festgelegt
        // as CategoryCell legt fest, dass es sich um eine Custom-Cell handelt
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            //IndexPath(row, section) -> indexPath.row wählt die row aus
            //category wird aus dem Array an der aktuellen Stelle bezogen
            //wieder steigt indexpath.row bei jedem aufrufen der Funktion um eins an
            //für jede Kategorie wird so eine Zelle erstellt
            let category = DataService.instance.getCategories()[indexPath.row]
            //nun wird dafür gesorgt, dass in der erstellten Zelle
            //ImageView und Label richtig angepasst werden
            
            cell.updateViews(category: category)
            
            //Die erstellte Zelle wird nun durch return zurückgegeben und gebaut
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn =  UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
        }
    }
    
    
    
    
    
    

}

