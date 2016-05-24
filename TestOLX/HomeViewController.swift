//
//  HomeViewController.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/23/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var searchTermTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToList" {
            (segue.destinationViewController as! ListingViewControllerTableViewController).searchTerm = searchTermTextField.text
            
        }
        
    }
}

