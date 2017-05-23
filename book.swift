
//
//  book.swift
//  MyApplication
//
//  Created by Арина Зубкова on 29.04.17.
//  Copyright © 2017 Арина Зубкова. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var author : String!
    var title : String!
    var notes : String!
    
    init(author : String, title: String, notes: String = "Оставьте отзыв") {
        self.author = author
        self.notes = notes
        self.title =  title
    }
}
