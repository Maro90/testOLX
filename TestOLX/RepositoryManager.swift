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
    
    private static func connectToURL(baseUrl:String,uri:String,connectionMethod:Alamofire.Method, parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void) {
        
        
        let url = baseUrl + uri
        
        Alamofire.request(connectionMethod, url, parameters: parameters as? [String : AnyObject], encoding: .URL, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                if let arrMethods = response.result.value as? [[String : AnyObject]] {
                    completionResponse(responseList: arrMethods, error: nil)
                    
                }
            } else{
                completionResponse(responseList: NSArray(), error: response.result.error)
                
            }
            
        }
        
    }

    static func getCardItemsWithParameters(parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void){
        
        let paramet = NSMutableDictionary(dictionary: parameters)
        
        paramet.setObject(GlobalSttings.getLocationDefault(), forKey: "location")
        
        connectToURL(GlobalSttings.getBaseURL(), uri: GlobalSttings.getUriItems(), connectionMethod: .GET,
                     parameters: paramet){   (responseList, error) in
                        completionResponse(responseList: responseList, error: error)
                        
        }
    }
}
