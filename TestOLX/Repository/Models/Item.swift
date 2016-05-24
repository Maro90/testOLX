//
//  Item.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/24/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

public class Item: NSObject {

    private var title : String!
    private var id : NSNumber!
    private var itemDescription : String!
    private var price : String!
    
    
    init(title: String, id: NSNumber, itemDescription: String, price : String) {
        self.title = title
        self.id = id
        self.itemDescription = itemDescription
        self.price = price
    }

    
    
    //Title
    public func getTitle()->String{
        return self.title
    }
    
    public func setTitle(title: String){
        self.title = title
    }
    
    //id
    public func getId()->NSNumber{
        return self.id
    }
    
    public func setId(id: NSNumber){
        self.id = id
    }
    
    //ItemDescription
    public func getItemDescription()->String{
        return self.itemDescription
    }
    
    public func setItemDescription(itemDescription: String){
        self.itemDescription = itemDescription
    }
    
    
    //Price
    public func getPrice()->String{
        return self.price
    }
    
    public func setPrice(price: String){
        self.price = price
    }

}
