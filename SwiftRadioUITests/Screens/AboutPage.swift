//
//  AboutPage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class AboutPage : BasePage {
    
    private lazy var logoImage = app.images["logo"]
    private lazy var featuresTextView = app.textViews.firstMatch
    private lazy var xcodeStaticText = app.otherElements.staticTexts["Xcode 9 / Swift 4"]
    private lazy var radioAppStaticText = app.otherElements.staticTexts["Radio App"]
    private lazy var websiteButton = app.otherElements.buttons["matthewfecher.com"]
    private lazy var emailButton = app.otherElements.buttons["email me"]
    private lazy var okayButton = app.otherElements.buttons["Okay"]
    
    func tapOkay() {
        okayButton.tapElement()
    }
    
    func waitForPageDisappear() {
        app.waitForElementExistence(okayButton, exists: false, notStrict: true)
    }
    
    func assertLogoImageIsVisible() {
        XCTAssertTrue(logoImage.isVisible())
    }
    
    func assertFeaturesHasText() {
        XCTAssertFalse((featuresTextView.value as? String)!.isEmpty)
    }
    
    func assertXcodeTextIsVisible() {
        XCTAssertTrue(xcodeStaticText.isVisible())
    }
    
    func assertRadioAppTextIsVisible() {
        XCTAssertTrue(radioAppStaticText.isVisible())
    }
    
    func assertWebsiteButtonIsHittable() {
        XCTAssertTrue(websiteButton.isHittable)
        XCTAssertTrue(websiteButton.elementContainsText(text: "matthewfecher.com"))
    }
    
    func assertEmailButtonIsHittable() {
        XCTAssertTrue(emailButton.isHittable)
        XCTAssertTrue(emailButton.elementContainsText(text: "email me"))
    }
    
    func assertOkayButtonIsHittable() {
        XCTAssertTrue(okayButton.isHittable)
        XCTAssertTrue(okayButton.elementContainsText(text: "Okay"))
    }
}
