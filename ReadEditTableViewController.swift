//
//  ReadEditTableViewController.swift
//  MyApplication
//
//  Created by Арина Зубкова on 24.05.17.
//  Copyright © 2017 Арина Зубкова. All rights reserved.
//

import UIKit

class ReadEditTableViewController: UITableViewController {
    
    @IBOutlet weak var nameCorrect: UITextField!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    @IBAction func editBtn(_ sender: Any) {
     
        self.nameCorrect.isEnabled = true
        
    }
    
    
    @IBAction func updateBtn(_ sender: Any) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
