//
//  UserComponentTests.swift
//  UserComponentTests
//
//  Created by Startdevelopment on 01/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import XCTest
@testable import UserComponent

class UserComponentTests: XCTestCase {

    var mainVc: ViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainVc = ViewController()
        _ = mainVc.view
    }

    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testrootbackground() {
        XCTAssertNotNil(mainVc.collectionView)
        XCTAssertEqual(mainVc.collectionView.backgroundColor, UIColor.systemBackground)
    }
    
    
    func testCellUIelements(){
        let cell = mainVc.collectionView.cellForItem(at: .init(row: 0, section: 0)) as! UserComponent
        let cellData = mainVc.snapshotForCurrentState().itemIdentifiers.first
        
        XCTAssertNotNil(cell)
        // test UI elements
        
        XCTAssertNotNil(cell.artistName)
        XCTAssertEqual(cell.artistName.text, cellData?.artistName)
        
        XCTAssertNotNil(cell.location)
        XCTAssertEqual(cell.location.text, cellData?.location)

        XCTAssertNotNil(cell.followers)
        XCTAssertEqual(cell.data?.follwersNumber, cellData?.follwersNumber)
        XCTAssertTrue(cell.playingLiveIcon.isHidden)
        
        XCTAssertNotNil(cell.followButton)
        XCTAssertNotNil(cell.playingLiveIcon)
        XCTAssertNotNil(cell.rootBackground)

        
        
    }
    
 

}
