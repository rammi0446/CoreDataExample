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
    }
    @IBAction func addData(_ sender: Any) {
        print("add button pressed")
    }
    

}

