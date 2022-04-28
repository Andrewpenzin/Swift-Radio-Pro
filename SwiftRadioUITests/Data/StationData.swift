//
//  StationData.swift
//  SwiftRadioUITests
//
//  Created by Andrei Penzin on 28.04.2022.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import Foundation

enum Station : CaseIterable {
    case absoluteCountryHits
    case newportFolkRadio
    case theRockFm
    case classicRock
    case radioElevenNinety
}

class StationData {
    
    let name: String
    let description: String
    
    init(_ type: Station) {
        switch(type) {
        case .absoluteCountryHits:
            name = "Absolute Country Hits"
            description = "The Music Starts Here"
        case .newportFolkRadio:
            name = "Newport Folk Radio"
            description = "Are you ready to Folk?"
        case .theRockFm:
            name = "The Rock FM"
            description = "Rock Music"
        case .classicRock:
            name = "Classic Rock"
            description = "Classic Rock Hits"
        case .radioElevenNinety:
            name = "Radio 1190"
            description = "KVCU - Boulder, CO"
        }
    }
}
