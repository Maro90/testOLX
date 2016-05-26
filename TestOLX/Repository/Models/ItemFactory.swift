//
//  ItemFactory.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/24/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

public class ItemFactory: NSObject {
    
    enum ItemFactoryError: ErrorType {
        case ItemsWithOutData
        case ItemWithOutData
        case ItemWithOutTitle
        case ItemWithOutId
        case ItemWithOutDescription
        case ItemWithOutPrice
        case ItemWithOutDisplayPrice
    }

    
    public static func convert(responseBody : AnyObject?) throws -> [Item]{
        var itemList = [Item]()
        
        if responseBody == nil {
            throw AppDebug.Throw("Response body is null", error:ItemFactoryError.ItemsWithOutData)
        }
        
        if let body = responseBody as? Dictionary<String, AnyObject> {
            if let data = body["data"] as? [Dictionary<String, AnyObject>] {
                if data.count == 0 {
                    throw AppDebug.Throw("error array empty", error:ItemFactoryError.ItemsWithOutData)
                }
                
                for object in data {
                    do {
                        let item = try self.createItem(object)
                        if item != nil {
                            itemList.append(item!)
                        }
                    } catch {
                        AppDebug.Log("Exception Block", info: object)
                    }
                }
                
            } else {
                throw AppDebug.Throw("Items List error", error:ItemFactoryError.ItemsWithOutData)
            }
        } else {
            throw AppDebug.Throw("Object not valid", error:ItemFactoryError.ItemsWithOutData)

        }
        
        if itemList.count == 0 {
            throw AppDebug.Throw("Item List is empty", error:ItemFactoryError.ItemsWithOutData)

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
                            throw AppDebug.Throw("Item without value of price", error:ItemFactoryError.ItemWithOutDisplayPrice)
                        }
                        
                    } else {
                        throw AppDebug.Throw("Item without Price", error:ItemFactoryError.ItemWithOutPrice)
                    }
                    
                } else {
                    throw AppDebug.Throw("Item without Description", error:ItemFactoryError.ItemWithOutDescription)
                }
                
            } else {
                throw AppDebug.Throw("Item without Id", error:ItemFactoryError.ItemWithOutId)
            }
            
        } else {
            throw AppDebug.Throw("Item without title", error:ItemFactoryError.ItemWithOutTitle)
        }        
    }
}
