//
//  BasePage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class BasePage : XCUIApplication {
    
    let app = XCUIApplication()
    
    private lazy var backgroundImage = app.images["background"]
    
    func assertBackgroundImageIsVisible() {
        XCTAssertTrue(backgroundImage.isVisible())
    }
}

