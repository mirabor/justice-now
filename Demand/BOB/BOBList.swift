//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct Location: Codable, Identifiable {
    let id = UUID()
    var name: String
    var items: [Business]
}

struct Business: Codable, Equatable, Identifiable {
    let id = UUID()
    var food: Bool
    var clothes: Bool
    var beauty: Bool
    var other: Bool
    var name: String
    var cuisine: String?
    var service: String?
    var website: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    #if DEBUG
    static let example = Business(food: false, clothes: false, beauty: false, other: false, name: "", website: "")
    #endif
}
