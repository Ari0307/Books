import UIKit

class ReadViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private var books = [Book]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! ReadTableViewCell
        cell.bookNameLabel.text = books[indexPath.item].author + " " + books[indexPath.item].title
        cell.infoButton.addTarget(self, action: #selector(showNotesViewController(_:)), for: .touchUpInside)
        return cell
    }
    
    
    @IBAction func addBook(_ sender: UIButton) {
        books.append(Book(author: "Пушкин", title: "Капитанская дочка"))
        booksTableView.beginUpdates()
        booksTableView.insertRows(at: [IndexPath(row: books.count - 1, section: 0)], with: .automatic)
        booksTableView.endUpdates()
    }
    
    func showNotesViewController(_ sender: UIButton){
        self.performSegue(withIdentifier: "ShowNotesViewController", sender: self)
    }

}
