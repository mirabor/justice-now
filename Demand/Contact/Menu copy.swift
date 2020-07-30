//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct ContactLabel: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [ContactPerson]
}

struct ContactPerson: Codable, Equatable, Identifiable {
    var id: String
    var name: String
    var photoCredit: String
    var price: String
    var local: Bool
    var representative: Bool
    var senator: Bool
    var byEmail: Bool
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = ContactPerson(id: String(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: "6", local: true, representative: true, senator: true, byEmail: false, description: "")
    #endif
}
