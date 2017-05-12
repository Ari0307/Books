import Foundation
import UIKit

class Book{
    var author : String!
    var title : String!
    var notes : String!
    
    init(author : String, title: String, notes: String = "Оставьте отзыв") {
        self.author = author
        self.notes = notes
        self.title =  title
    }
}
