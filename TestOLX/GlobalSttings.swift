//
//  GlobalSttings.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/24/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

public class GlobalSttings: NSObject {
    
    static func getBaseURL() -> String{
        return "http://api-v2.olx.com/"
    }
    
    static func getUriItems() -> String{
        return "items"
    }

    static func getLocationDefault() -> String{
        return "www.olx.com.ar"
    }

}
