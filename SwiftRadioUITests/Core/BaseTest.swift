//
//  BaseTest.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import XCTest

class BaseTest : XCTestCase {
    
    let app = XCUIApplication()
    
    //MARK: Pages
    lazy var stationsPage = StationsPage()
    lazy var nowPlayingPage = NowPlayingPage()
    lazy var stationInfoPage = StationInfoPage()
    lazy var popUpPage = PopUpPage()
    lazy var aboutPage = AboutPage()
    
    func getRandomStation() -> Station {
        Station.allCases[Int.random(in: 0..<Station.allCases.count)]
    }
    override func setUp() {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDown() {
        
    }
}
