//
//  RadioStation.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 27.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class RadioStation {
    
    private let app = XCUIApplication()
    
    let stationCell: XCUIElement
    let nameStaticText: XCUIElement
    let descriptionStaticText: XCUIElement
    let image: XCUIElement
    
    init(_ name: String) {
        stationCell = app.tables.cells.containing(.staticText, identifier: name).element
        nameStaticText = stationCell.staticTexts.element(boundBy: 1)
        descriptionStaticText = stationCell.staticTexts.element(boundBy: 0)
        image = stationCell.images.firstMatch
    }
    
    func assertStationExists(_ stationData: StationData) {
        XCTAssertTrue(nameStaticText.elementContainsText(text: stationData.name))
        XCTAssertTrue(descriptionStaticText.elementContainsText(text: stationData.description))
        XCTAssertTrue(image.isHittable)
    }
}
