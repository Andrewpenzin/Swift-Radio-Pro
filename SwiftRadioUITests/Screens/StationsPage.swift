//
//  StationsPage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class StationsPage : BasePage {
    
    private lazy var popUpButton = app.navigationBars["Swift Radio"].buttons.element(boundBy: 0)
    private lazy var nowPlayingButton = app.navigationBars["Swift Radio"].buttons.element(boundBy: 1)
    private lazy var navigationBarText = app.navigationBars["Swift Radio"].staticTexts["Swift Radio"]
    private lazy var stationsCells = app.tables.firstMatch.cells
    private lazy var nowPlayingBarButton = app.otherElements.buttons["nowPlaying"]
    private lazy var nowPlayingBarImage = app.otherElements.images["NowPlayingBars"]
    private lazy var absoluteCountryHitsCell = app.tables.cells.containing(.staticText, identifier: "Absolute Country Hits").element
    private lazy var newportFolkRadioCell = app.tables.cells.containing(.staticText, identifier: "Newport Folk Radio").element
    private lazy var theRockFmCell = app.tables.cells.containing(.staticText, identifier: "The Rock FM").element
    private lazy var classicRockCell = app.tables.cells.containing(.staticText, identifier: "Classic Rock").element
    private lazy var radioElevenNinetyCell = app.tables.cells.containing(.staticText, identifier: "Radio 1190").element
    
    //MARK: Common
    
    private func getStationCell(_ stationType: Station) -> XCUIElement {
        switch stationType {
        case .absoluteCountryHits:
            return absoluteCountryHitsCell
        case .newportFolkRadio:
            return newportFolkRadioCell
        case .theRockFm:
            return theRockFmCell
        case .classicRock:
            return classicRockCell
        case .radioElevenNinety:
            return radioElevenNinetyCell
        }
    }
    
    func waitForPageExistense() {
        app.waitForElementExistence(navigationBarText, notStrict: true)
    }
    
    func selectRadioStation(_ stationType: Station) {
        getStationCell(stationType).tapElement()
    }
    
    func tapPopUpButton() {
        popUpButton.tapElement()
    }
    
    //MARK: Asserts
    
    func assertStationsCount(_ expectedCount: Int) {
        XCTAssertTrue(stationsCells.count == expectedCount)
    }
    
    func assertNowPlayingBarExists(_ expectedText: String) {
        XCTAssertTrue(nowPlayingBarButton.isHittable)
        XCTAssertTrue(nowPlayingBarImage.isHittable)
        XCTAssertTrue(nowPlayingBarButton.label == expectedText)
    }
    
    func assertNowPlayingButtonIsHittable() {
        XCTAssertTrue(nowPlayingButton.isHittable)
    }
    
    func assertPopUpButtonIsHittable() {
        XCTAssertTrue(popUpButton.isHittable)
    }
    
    func assertStationCellExists(_ stationType: Station) {
        let stationCell = getStationCell(stationType)
        let stationData = StationData(stationType)
        
        XCTAssertTrue(stationCell.isHittable)
        XCTAssertTrue(stationCell.elementContainsText(text: stationData.name))
        XCTAssertTrue(stationCell.elementContainsText(text: stationData.description))
        XCTAssertTrue(stationCell.elementContainsImages(1))
    }
}


