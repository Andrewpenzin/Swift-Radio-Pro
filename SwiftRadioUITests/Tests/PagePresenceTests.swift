//
//  SwiftRadioUITests.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 27.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation
import XCTest

class PagePresenceTests: BaseTest {
    
    func testStationsPagePresence() {
        stationsPage.waitForPageExistense()
        stationsPage.assertBackgroundImageIsVisible()
        stationsPage.assertImageCountOnPage(imagesCount: 7)
        stationsPage.assertStationsCount(Station.allCases.count)
        stationsPage.assertPopUpButtonIsHittable()
        stationsPage.assertNowPlayingBarExists("Choose a station above to begin")
        for station in Station.allCases {
            stationsPage.assertStationCellExists(station)
        }
    }
    
    func testNowPlayingPagePresence() {
        let station = Station.absoluteCountryHits
        
        stationsPage.selectRadioStation(station)
        nowPlayingPage.waitForPageExistense()
        nowPlayingPage.assertImageCountOnPage(imagesCount: 4)
        nowPlayingPage.assertBackgroundImageIsVisible()
        nowPlayingPage.assertNavigationBarStaticText(station)
        nowPlayingPage.assertSongNameHasText()
        nowPlayingPage.assertArtistNameHasText()
        nowPlayingPage.assertBackButtonIsHittable()
        nowPlayingPage.assertLogoButtonIsHittable()
        nowPlayingPage.assertPlayButtonIsHittable()
        nowPlayingPage.assertStopButtonIsHittable()
        nowPlayingPage.assertShareButtonIsHittable()
        nowPlayingPage.assertAirPlayButtonIsHittable()
        nowPlayingPage.assertVolumeImagesIsVisible()
        nowPlayingPage.assertVolumeSliderIsHittable()
        nowPlayingPage.assertMoreInfoButtonIsHittable()
    }
    
    func testAboutStationPagePresence() {
        let station = getRandomStation()
        
        stationsPage.selectRadioStation(station)
        nowPlayingPage.openMoreInfo()
        stationInfoPage.assertBackgroundImageIsVisible()
        stationInfoPage.assertOkayButtonIsHittable()
        stationInfoPage.assertAboutTextViewHasText()
        stationInfoPage.assertStationNameIsVisible(station)
        stationInfoPage.assertStationDescriptionIsVisible(station)
    }
    
    func testPopUpPagePresence() {
        stationsPage.tapPopUpButton()
        popUpPage.assertLogoImageIsVisible()
        popUpPage.assertAboutButtonIsHittable()
        popUpPage.assertCloseButtonIsHittable()
        popUpPage.assertCredentialsTextIsVisible()
        popUpPage.closePage()
        popUpPage.waitForPageDisappear()
    }
    
    func testAboutPagePresence() {
        stationsPage.tapPopUpButton()
        popUpPage.tapAboutButton()
        aboutPage.assertLogoImageIsVisible()
        aboutPage.assertOkayButtonIsHittable()
        aboutPage.assertFeaturesHasText()
        aboutPage.assertXcodeTextIsVisible()
        aboutPage.assertEmailButtonIsHittable()
        aboutPage.assertWebsiteButtonIsHittable()
        aboutPage.assertRadioAppTextIsVisible()
        aboutPage.tapOkay()
        aboutPage.waitForPageDisappear()
    }
}
