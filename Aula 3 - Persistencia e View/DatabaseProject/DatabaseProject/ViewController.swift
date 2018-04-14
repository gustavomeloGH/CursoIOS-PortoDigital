//
//  ViewController.swift
//  DatabaseProject
//
//  Created by Lab on 07/04/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [NSManagedObject] = []

    override func viewDidLoad() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let personEntity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let descriptor = NSSortDescriptor(key: "name", ascending: true)
        
        /* obter os dados */
        
     /* people = fetch(managedContext, "Person") */
        people = fetchWithDescriptor(managedContext, "Pessoa", descriptor)
        
        
        /* deletar os dados */
     /* deleteAll(people, managedContext) */
        
        
        for pessoa in people{
            /* Maneira para todos os campos terem dados */
            if let nome = pessoa.value(forKey: "name"), let idade = pessoa.value(forKey: "age") {
                
                if let spouse = pessoa.value(forKey: "spouse") as? NSManagedObject {
                    print("Pessoa: \(nome), idade: \(idade), companheiro(a): "
                        + "\(String(describing: spouse.value(forKey: "name") as? String))")
                        
                } else {
                    print("Pessoa: \(nome), idade: \(idade)")
                }
                
            }
        }
        
//        let person1 = NSManagedObject(entity: personEntity!, insertInto: managedContext)
//        person1.setValue("Joao", forKey: "name")
//        person1.setValue(29, forKey: "age")
//
//        let person2 = NSManagedObject(entity: personEntity!, insertInto: managedContext)
//        person2.setValue("Maria", forKey: "name")
//        person2.setValue(24, forKey: "age")
//
//        /* Ligacao - 1 para 1 */
//        person2.setValue(person1, forKey: "spouse")
//
//        let personChildren = NSManagedObject(entity: personEntity!, insertInto: managedContext)
//        personChildren.setValue("Lucas", forKey: "name")
//        personChildren.setValue(10, forKey: "age")
//
//        /* Ligacao - 1 para vários */
//        let children = person2.mutableSetValue(forKeyPath: "children")
//        children.add(personChildren)
//
       // save ( managedContext )
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /* CRUD */
    
    
    func save (_ context: NSManagedObjectContext) {
        do {
            try context.save()
            print ("Save Successfull")
        } catch let error as NSError {
            print("Could not save.  \(error) \(error.userInfo)")
        }
    }
    
    func deleteAll (_ objects: [NSManagedObject], _ context: NSManagedObjectContext) {
        for object in objects{
            context.delete(object)
        }
        print(save(context))
    }
    
    func fetch (_ context: NSManagedObjectContext, _ entityName: String)
        -> [NSManagedObject]{
        
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
            
            do {
                let objects = try context.fetch(fetchRequest)
                print("Fetch Sucessfull.")
                return objects
            } catch let error as NSError {
                print("Could not Fetch. \(error) \(error.userInfo)")
                return []
            }
            
    }
    
    func fetchWithDescriptor (_ context: NSManagedObjectContext,
                              _ entityName: String,
                              _ descriptor: NSSortDescriptor)
                              -> [NSManagedObject]{
            
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let descriptor2 = NSSortDescriptor(key: "age", ascending: true)
        fetchRequest.sortDescriptors = [descriptor, descriptor2]
                                
        do {
            let objects = try context.fetch(fetchRequest)
            print("Fetch Sucessfull.")
            return objects
        } catch let error as NSError {
            print("Could not Fetch. \(error) \(error.userInfo)")
            return []
        }
    }


}

