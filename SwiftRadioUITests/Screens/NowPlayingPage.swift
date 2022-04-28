//
//  NowPlayningPage.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 26.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class NowPlayingPage : BasePage {
    
    private lazy var backButton = app.navigationBars.buttons["Back"]
    private lazy var navigationBarStaticText = app.navigationBars.staticTexts.firstMatch
    private lazy var playButton = app.otherElements.buttons["btn play"]
    private lazy var stopButton = app.otherElements.buttons["btn stop"]
    private lazy var airPlayButton = app.buttons.containing(.staticText, identifier: nil).element
    private lazy var shareButton = app.buttons["share"]
    private lazy var moreInfoButton = app.buttons["More Info"]
    private lazy var logoButton = app.buttons["logo"]
    private lazy var volumeSlider = app.sliders.containing(NSPredicate(format: "label != 'Volume'")).element
    private lazy var volMinImage = app.images["vol-min"]
    private lazy var volMaxImage = app.images["vol-max"]
    private lazy var artistNameStaticText = app.otherElements.staticTexts.element(boundBy: 2)
    private lazy var songNameStaticText = app.otherElements.staticTexts.element(boundBy: 1)
    private lazy var radioPausedStaticText = app.otherElements.staticTexts["Station Paused..."]
    private lazy var radioStoppedStaticText = app.otherElements.staticTexts["Station Stopped..."]
    
    //MARK: Common
    
    func waitForPageExistense() { 
        app.waitForElementExistence(navigationBarStaticText, notStrict: true)
    }
    
    func openMoreInfo() {
        moreInfoButton.tapElement()
    }
    
    func tapPlayButton() {
        playButton.tapElement()
    }
    
    func tapStopButton() {
        stopButton.tapElement()
    }
    
    func dragVolumeSlider(_ position: CGFloat) {
        volumeSlider.adjust(toNormalizedSliderPosition: position)
    }
    
    func tapBackButton() {
        backButton.tap()
    }
    
    func getSongString(_ station:StationData) -> String {
        return songNameStaticText.label + " - " + artistNameStaticText.label
    }
    
    //MARK: Asserts
    
    func assertLoadingStation(){
        XCTAssertTrue(songNameStaticText.waitForElementTextDisappear("Loading Station ..."))
    }
    
    func assertLoadingSong(_ station:StationData) {
        XCTAssertTrue(songNameStaticText.waitForElementTextDisappear(station.name))
        XCTAssertTrue(songNameStaticText.waitForElementTextDisappear(station.description))
    }
    
    func assertVolumeSliderPosition(_ value: Int) {
        XCTAssertTrue(volumeSlider.value as! String == "\(value) %")
    }
    
    func assertRadioPausedTextExists(_ exists: Bool) {
        XCTAssertTrue(exists ? radioPausedStaticText.exists : !radioPausedStaticText.exists)
    }
    
    func assertRadioStoppedTextExists(_ exists: Bool) {
        XCTAssertTrue(exists ? radioStoppedStaticText.exists : !radioStoppedStaticText.exists)
    }
    
    func assertNavigationBarStaticText(_ stationType: Station) {
        XCTAssertTrue(navigationBarStaticText.label == StationData(stationType).name)
    }
    
    func assertBackButtonIsHittable() {
        XCTAssertTrue(backButton.isHittable)
    }
    
    func assertPlayButtonIsHittable() {
        XCTAssertTrue(playButton.isHittable)
    }
    
    func assertStopButtonIsHittable() {
        XCTAssertTrue(stopButton.isHittable)
    }
    
    func assertAirPlayButtonIsHittable() {
        XCTAssertTrue(airPlayButton.isHittable)
    }
    
    func assertShareButtonIsHittable() {
        XCTAssertTrue(shareButton.isHittable)
    }
    
    func assertMoreInfoButtonIsHittable() {
        XCTAssertTrue(moreInfoButton.isHittable)
    }
    
    func assertLogoButtonIsHittable() {
        XCTAssertTrue(logoButton.isHittable)
    }
    
    func assertVolumeSliderIsHittable() {
        XCTAssertTrue(volumeSlider.isHittable)
    }
    
    func assertVolumeImagesIsVisible() {
        XCTAssertTrue(volMaxImage.isVisible())
        XCTAssertTrue(volMinImage.isVisible())
    }
    
    func assertArtistNameHasText() {
        assertLoadingStation()
        XCTAssertTrue(!artistNameStaticText.label.isEmpty)
    }
    
    func assertSongNameHasText() {
        assertLoadingStation()
        XCTAssertTrue(!songNameStaticText.label.isEmpty)
    }
}
