//  ReadViewController.swift
//  MyApplication
//
//  Created by Арина Зубкова on 29.04.17.
//  Copyright © 2017 Арина Зубкова. All rights reserved.
//

import UIKit
import CoreData

class ReadViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
   
    var people: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Прочитал"
        booksTableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "BookCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Book1")
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addRow(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: " Новая книга",
                                      message: "Добавить новую книгу",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [unowned self] action in
            
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text
                else {
                    return
            }
            
            self.save(name: nameToSave)
            self.booksTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Book1",
                                                in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func showNotesViewController(_ sender: UIButton){
        self.performSegue(withIdentifier: "ShowNotesViewController", sender: self)
    }
    

    
    
}

// MARK: - UITableViewDataSource
extension ReadViewController: UITableViewDataSource {
    
    func tableView(_ booksTableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        
        return people.count
    }
    
    func tableView(_ booksTableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = people[indexPath.row]
        let cell = booksTableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        return cell
    }
    func tableView(_ booksTableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            // Initialize Fetch Request
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book1")
            
            // Configure Fetch Request
            fetchRequest.includesPropertyValues = false
            
            do {
                let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
                
                managedContext.delete(items[indexPath.row])
                people.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                
                try managedContext.save()
            }
            catch
            {
                print("error")
            }
            
        }
        
    }
    
    
}




