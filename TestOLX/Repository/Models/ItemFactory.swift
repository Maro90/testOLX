//
//  ItemFactory.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/24/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

public class ItemFactory: NSObject {
    
    public static func convert(responseBody : AnyObject?) throws -> [Item]{
        var itemList = [Item]()
        
        if responseBody == nil {
            print("error, body nil")
        }
        
        if let body = responseBody as? Dictionary<String, AnyObject> {
            if let data = body["data"] as? [Dictionary<String, AnyObject>] {
                if data.count == 0 {
                    print("error array empty")
                }
                
                for object in data {
                    do {
                        let item = try self.createItem(object)
                        if item != nil {
                            itemList.append(item!)
                        }
                    } catch {
                        print("Exception Item")
                    }
                }
                
            } else {
                print("Loss in server the Data List")
            }
        } else {
            print("Object not valid")
        }
        
        if itemList.count == 0 {
            print("Item List is empty")
        }
        
        return itemList
    }
    
    
    public static func createItem( data : Dictionary<String, AnyObject>) throws -> Item? {
        if let title = data["title"] as? String {
            
            if let id = data["id"] as? NSNumber {
                
                if let info = data["description"] as? String {
                    
                    if let price = data["price"] as? Dictionary<String, AnyObject> {
                        
                        if let priceValue = price["displayPrice"] as? String{
                            
                            return Item(title: title, id: id, itemDescription: info, price: priceValue)
                            
                        } else {
                            print("Loss in server the Price")
                        }
                        
                    } else {
                        print("Loss in server the Price")
                    }
                    
                } else {
                    print("Loss in server the Description")
                }
                
            } else {
                print("Loss in server the Id")
            }
            
        } else {
            print("Loss in server the Title")
        }
        
        return nil
    }
}
