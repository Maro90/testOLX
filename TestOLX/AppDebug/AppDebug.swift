//
//  AppDebug.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/25/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

public class AppDebug {
    static let shouldDebugLog = true
    static let shouldDebugThrow = true
    
    public class func Log(title:String , info:Any) {
        if shouldDebugLog {
            print("👁 Log: \(title) --")
            print(info)
            print("-----------------------------------")
        }
    }
    
    public class func Throw(info: String, error: ErrorType) -> ErrorType {
        if shouldDebugThrow {
            print("⚠️ Exception: \(error) --")
            print(info)
            print("-----------------------------------")
        }
        return error
    }
}
