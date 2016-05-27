//
//  ModelFactoryTest.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/25/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import XCTest
@testable import TestOLX

class ModelFactoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //---------------------------------------------------------------------------------------------------------------------

    //Tests for itemList

    
    /*
     *  This test is to try to create a itemLis with 3 items
     */

    func testParserDoItRight() {
        var arr : [Item]
        
        let json = ["data":[["title":"ojotas","description":"son un par de ojotas usadas","id":346234,"price":["displayPrice":"$120"]],["title":"sandalias","description":"son un par de sandalias usadas","id":553245,"price":["displayPrice":"$320"]],["title":"Pasto de la bombonera","description":"pasto cortado de la bombonera la ultima consagracion como campeon","id":346834,"price":["displayPrice":"$1200"]]]]

        do{
            arr = try ItemFactory.convert(json)
            XCTAssertEqual(arr.count,3, "Must have 3")
        } catch {
            XCTAssert(false, "It shouldn't catch")
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------

    /*
     *  This test is to try to create a itemLis without the data key
     *  It should catch the exception
     */
    
    func testParserWithOutDataKey() {
        let json = ["info":[["title":"ojotas","description":"son un par de ojotas usadas","id":346234,"price":["displayPrice":"$120"]]]]

        
        XCTAssertThrowsError(try ItemFactory.convert(json), "wrong data") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemsWithOutData)
        }

    }
    
    //---------------------------------------------------------------------------------------------------------------------
    
    /*
     *  This test is to try to create a itemList with the only one right item
     *  It shouldn't catch the exception
     */

    func testParserOnlyOneItemsRight() {
        let json = ["data":[["title":"ojotas","description":"son un par de ojotas usadas","id":346234,"price":["displayPrice":"$120"]],["title":"sandalias","description":"son un par de sandalias usadas","id":553245,"price":NSNull()],["title":"Pasto de la bombonera","id":346834,"price":["displayPrice":"$1200"]]]]
        
        do{
            let arr = try ItemFactory.convert(json)
            XCTAssertEqual(arr.count,1, "Only must have one")
            
        } catch {
            XCTAssert(true, "It shouldn't catch")
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------

    /*
     *  This test is to try to create a itemList with an empty array
     *  It should catch the exception
     */

    func testParserArrayEmpty() {
        let json = ["data":[]]
        
        XCTAssertThrowsError(try ItemFactory.convert(json), "wrong data") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemsWithOutData)
        }
    }

    
    
    
    //---------------------------------------------------------------------------------------------------------------------
    //---------------------------------------------------------------------------------------------------------------------

    
    //Tests for key's item
    
    /*
     *  This test is to try to create a item without the title key
     *  It should catch the exception
     */
    
    func testParserWithOutTitleKey() {
        
        let json = ["description":"son un par de ojotas usadas","id":346234,"price":["displayPrice":"$120"]]
        
        XCTAssertThrowsError(try ItemFactory.createItem(json), "wrong title") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemWithOutTitle)
        }
    }

    //---------------------------------------------------------------------------------------------------------------------

    /*
     *  This test is to try to create a item without the Description key
     *  It should catch the exception
     */
    
    func testParserWithOutDescriptionKey() {
        
        let json = ["title":"ojotas","descripSion":"son un par de ojotas usadas","id":346234,"price":["displayPrice":"$120"]]
        XCTAssertThrowsError(try ItemFactory.createItem(json), "wrong description") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemWithOutDescription)
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------
    
    /*
     *  This test is to try to create a item without the ID key
     *  It should catch the exception
     */
   
    func testParserWithOutIdKey() {
        
        let json = ["title":"ojotas","description":"son un par de ojotas usadas","udid":346234,"price":["displayPrice":"$120"]]
        
        XCTAssertThrowsError(try ItemFactory.createItem(json), "wrong data") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemWithOutId)
        }
    }

    //---------------------------------------------------------------------------------------------------------------------
    
    /*
     *  This test is to try to create a item without the Price key
     *  It should catch the exception
     */

    func testParserWithOutPriceKey() {
        
        let json = ["title":"ojotas","description":"son un par de ojotas usadas","id":346234,"precio":["displayPrice":"$120"]]
        
        XCTAssertThrowsError(try ItemFactory.createItem(json), "wrong data") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemWithOutPrice)
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------
    
    /*
     *  This test is to try to create a item without the DisplayPrice key
     *  It should catch the exception
     */

    func testParserWithOutDisplaPriceKey() {
        
        let json = ["title":"ojotas","description":"son un par de ojotas usadas","id":346234,"price":["value":"120"]]
        
        XCTAssertThrowsError(try ItemFactory.createItem(json), "wrong data") { (error) in
            XCTAssertEqual(error as? ItemFactory.ItemFactoryError, ItemFactory.ItemFactoryError.ItemWithOutDisplayPrice)
        }
    }
}
