//
//  SeacrhViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-12.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class SeacrhViewController: UIViewController {

    var name:String = "";
    //Mark:1
     var context:NSManagedObjectContext!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("name :\(self.name)")
        //
        // FETCH THE DATA
        // ====================
        
        // 1. Create context variables & Set it up your context vars
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
        // 2. make the fetch request
        // 3. show the results
        
        // SELECT * FROM USER WHERE email="-------"
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "name == %@", self.name)
        
        do {
            let results = try self.context.fetch(fetchRequest) as [Person]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            if (results.count == 1) {
                let x = results[0] as Person      // get the result out of the array
                lblName.text = x.name!
               lblAge.text = String(x.age)
            }
            else if (results.count == 0) {
                lblName.text = "Error, no results found!"
            }
            else if (results.count > 1) {
                lblAge.text = "Sorry, more than 1 result found!"
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
