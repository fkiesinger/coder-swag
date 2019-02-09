//
//  Category.swift
//  coder-swag
//
//  Created by Finn Kiesinger on 09.02.19.
//  Copyright © 2019 Finn Kiesinger. All rights reserved.
//

import Foundation

struct Category {
    
    private(set) public var title: String
    private(set) public var imageName: String
    
    //Eine Category besteht aus einem Bildnamen und einer Bezeichnung der Category
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
}
