//
//  EditViewController.swift
//  CoreDataExample
//
//  Created by MacStudent on 2018-11-12.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {

    // PLACEHOLDER HOLDER
    var person:Person!
    
    @IBOutlet weak var txtEditName: UITextField!
    @IBOutlet weak var txtEditAge: UITextField!
    
    var context:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
        
        // DEBUG: Print contents from database
        print("DEBUG: Email: \(self.person.name)")
        print("DEBUG: Password: \(self.person.age)")
        txtEditName.text = self.person.name;
        txtEditAge.text = String(self.person.age);
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
