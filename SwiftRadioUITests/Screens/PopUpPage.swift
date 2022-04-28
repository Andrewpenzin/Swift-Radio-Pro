//
//  PopUpPage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class PopUpPage : BasePage {
    
    private lazy var closeButton = app.buttons["btn close"]
    private lazy var logoImage = app.images["swift-radio-black"]
    private lazy var aboutButton = app.otherElements.buttons["About"]
    private lazy var credentialsStaticText = app.otherElements.staticTexts["Matt Fecher & Fethi El Hassasna"]
    
    func closePage() {
        closeButton.tapElement()
    }
    
    func tapAboutButton() {
        aboutButton.tapElement()
    }
    
    func waitForPageDisappear() {
        app.waitForElementExistence(logoImage, exists: false, notStrict: true)
    }
    
    func assertCloseButtonIsHittable() {
        XCTAssertTrue(closeButton.isHittable)
    }
    
    func assertLogoImageIsVisible() {
        XCTAssertTrue(logoImage.isVisible())
    }
    
    func assertAboutButtonIsHittable() {
        XCTAssertTrue(aboutButton.isHittable)
    }
    
    func assertCredentialsTextIsVisible() {
        XCTAssertTrue(credentialsStaticText.isVisible())
    }
    
}
