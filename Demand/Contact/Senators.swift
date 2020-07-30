//
//  Senators.swift
//  Demand
//
//  Created by Mira Yu on 6/11/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI

struct Topics: Codable, Equatable, Identifiable {
    var id: String
    var name: String
    var description: String
    
    #if DEBUG
    static let example = Topics(id: String(), name: "", description: "")
     #endif

}

struct TopicDescriptions: Codable, Equatable, Identifiable {
    var id: String
    var content: String

    #if DEBUG
    static let example = TopicDescriptions(id: String(), content: "")
    #endif
}

