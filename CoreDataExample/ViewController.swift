//
//  ViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData     //import core data library
class ViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    
    // 2. Add mandatory core data variables
    var context:NSManagedObjectContext!
    
    // Mark: Outlets
     @IBOutlet weak var txtData: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        initialize core data variables
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: Actions
    @IBAction func loadData(_ sender: Any) {
        print("load button pressed")
        // This is the same as:  SELECT * FROM Person
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [Person]
            let results = try self.context.fetch(fetchRequest) as [Person]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("person age: \(x.age)")
                print("person name: \(String(describing: x.name))")
            }
        }
        catch let error{
            print("Error when fetching from database \(error.localizedDescription)")
        }
    }
    
    
    
    @IBAction func addData(_ sender: Any) {
        print("add button pressed")
        //. Get Data from text field
        let x = txtData.text!
        
        // create a " person" object
        var p = Person(context: self.context)
        // set the properties of the person object
        
        p.age = 40
        p.name = x
        //save person object to database
        do{
            try self.context.save()
            print("save person to database");
        }
        catch
        {
            print("error while saving data")
        }
        //done
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("hello !!!!!");
      // let screen2 = segue.destination as! SeacrhViewController
      // screen2.name = self.txtSearch.text!
        let editScreen = segue.destination as! EditViewController
        
        //SELECT * FROM User WHERE email = .....
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "name == %@", "qqqqqq")
        
        do {
            
            let results = try self.context.fetch(fetchRequest) as [Person]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            if (results.count == 1) {
                editScreen.person = results[0] as Person
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
        
    }
    

}

