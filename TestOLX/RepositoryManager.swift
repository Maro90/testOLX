//
//  RepositoryManager.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/23/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class RepositoryManager: NSObject {
    
    private static func connectToURL(baseUrl:String,uri:String,connectionMethod:Alamofire.Method, parameters:NSDictionary, completionResponse: (response: AnyObject, error: NSError?)->Void) {
        
        
        let url = baseUrl + uri
        
        Alamofire.request(connectionMethod, url, parameters: parameters as? [String : AnyObject], encoding: .URL, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                completionResponse(response: response.result.value!, error: nil)
            } else{
                completionResponse(response: NSArray(), error: response.result.error)
                
            }
            
        }
        
    }

    static func getItemsWithParameters(parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void){
        
        let paramet = NSMutableDictionary(dictionary: parameters)
        
        paramet.setObject(GlobalSttings.getLocationDefault(), forKey: "location")
        
        connectToURL(GlobalSttings.getBaseURL(), uri: GlobalSttings.getUriItems(), connectionMethod: .GET,
                     parameters: paramet){   (response, error) in
                        
                        let itemList : NSArray
                        
                        do{
                            itemList = try ItemFactory.convert(response) as NSArray
                        }
                        catch{
                            itemList = NSArray()
                        }
                        
                        
                        completionResponse(responseList: itemList, error: error)
                        
        }
    }
}
