//
//  OtherTests.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 28.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class OtherTests: BaseTest {
    
    func testNowPlayingButtons() {
        stationsPage.selectRadioStation(.absoluteCountryHits)
        nowPlayingPage.tapPlayButton()
        nowPlayingPage.assertRadioPausedTextExists(true)
        nowPlayingPage.tapPlayButton()
        nowPlayingPage.assertRadioPausedTextExists(false)
        nowPlayingPage.tapStopButton()
        nowPlayingPage.assertRadioStoppedTextExists(true)
        nowPlayingPage.tapPlayButton()
        nowPlayingPage.assertRadioStoppedTextExists(false)
    }
    
    func testVolumeSlider() {
        stationsPage.selectRadioStation(.absoluteCountryHits)
        nowPlayingPage.dragVolumeSlider(0.0)
        nowPlayingPage.assertVolumeSliderPosition(0)
        nowPlayingPage.dragVolumeSlider(0.4)
        nowPlayingPage.assertVolumeSliderPosition(42)
        nowPlayingPage.dragVolumeSlider(1.0)
        nowPlayingPage.assertVolumeSliderPosition(100)
    }
    
    func testNowPlayingBar() {
        let station = StationData(.absoluteCountryHits)
        
        stationsPage.selectRadioStation(.absoluteCountryHits)
        nowPlayingPage.assertLoadingStation()
        nowPlayingPage.assertLoadingSong(station)
        let song = nowPlayingPage.getSongString(station)
        
        nowPlayingPage.tapBackButton()
        stationsPage.assertNowPlayingBarExists(station.name + ": " + song)
        stationsPage.assertNowPlayingButtonIsHittable()
    }
    
    func testSwitchStations() {
        stationsPage.selectRadioStation(.absoluteCountryHits)
        nowPlayingPage.assertLoadingStation()
        nowPlayingPage.assertNavigationBarStaticText(.absoluteCountryHits)
        nowPlayingPage.tapBackButton()
        stationsPage.selectRadioStation(.theRockFm)
        nowPlayingPage.assertLoadingStation()
        nowPlayingPage.assertNavigationBarStaticText(.theRockFm)
    }
}
