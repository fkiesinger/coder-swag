//
//  CategoryCell.swift
//  coder-swag
//
//  Created by Finn Kiesinger on 09.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    //Image und Label deklarieren, die im TableView vorhanden sind
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    
    //Bild und Label für ausgewählte Zelle festlegen
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
