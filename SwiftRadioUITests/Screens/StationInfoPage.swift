//
//  StationInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class StationInfoPage : BasePage {
    
    private lazy var backButton = app.navigationBars.buttons.firstMatch
    private lazy var stationImage = app.otherElements.images.containing(NSPredicate(format: "identifier != 'background'")).element
    private lazy var okayButton = app.buttons["Okay"]
    private lazy var aboutTextView = app.textViews.element(boundBy: 1)
    private lazy var stationName = app.staticTexts.element(boundBy: 1)
    private lazy var stationDescription = app.staticTexts.element(boundBy: 2)
    
    func assertStationImageIsVisible() {
        XCTAssertTrue(stationImage.isVisible())
    }
    
    func assertStationNameIsVisible(_ stationType: Station) {
        XCTAssertTrue(stationName.isVisible())
        XCTAssertTrue(stationName.label == StationData(stationType).name)
    }
    
    func assertStationDescriptionIsVisible(_ stationType: Station) {
        XCTAssertTrue(stationDescription.isVisible())
        XCTAssertTrue(stationDescription.label == StationData(stationType).description)
    }
    
    func assertOkayButtonIsHittable() {
        XCTAssertTrue(okayButton.isHittable)
    }
    
    func assertAboutTextViewHasText() {
        XCTAssertTrue(aboutTextView.isVisible())
        XCTAssertFalse(aboutTextView.label.isEmpty)
    }
}
