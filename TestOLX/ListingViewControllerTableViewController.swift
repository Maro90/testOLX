//
//  ListingViewControllerTableViewController.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/23/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class ListingViewControllerTableViewController: UITableViewController {

    var searchTerm : String!
    var itemList : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60

        
        RepositoryManager.getItemsWithParameters(["searchTerm":searchTerm]) { (responseList, error) in
            self.itemList = NSMutableArray(array: responseList)
            self.tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.itemList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ItemTableViewCell

        // Configure the cell...
        cell.loadData(self.itemList.objectAtIndex(indexPath.row) as! Item)
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alertController = UIAlertController(title: "El ítem seleccionado es", message: "\((self.itemList.objectAtIndex(indexPath.row) as! Item).getId())", preferredStyle: .Alert)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        alertController.addAction(OKAction)
        
        
        
        self.presentViewController(alertController, animated: true) {
        }
        
    }
    
}
