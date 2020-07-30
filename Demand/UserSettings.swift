//
//  UserSettings.swift
//  Demand
//
//  Created by Mira Yu on 6/11/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

public class UserSettings: ObservableObject {
    
     @Published var senatorChoice = ""
     @Published var topicDescription = ""
     
     @Published var houseTopicDescription = ""
     @Published var zIndexAds = 0
     
     @Published var savedTimer = Timer.publish(every: 100, tolerance: 5, on: .main, in: .common).autoconnect()
     
     @Published var playAd = false
     
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var area: String {
        didSet {
        UserDefaults.standard.set(area, forKey: "area")
    }
    }
    
    @Published var collectName: Bool {
        didSet {
        UserDefaults.standard.set(collectName, forKey: "collectName")
    }
    }
    
    @Published var collectArea: Bool {
        didSet {
        UserDefaults.standard.set(collectArea, forKey: "collectArea")
    }
    }
    
    @Published var representative: String {
        didSet {
        UserDefaults.standard.set(representative, forKey: "representative")
        }
    }
    @Published var state: String {
        didSet {
        UserDefaults.standard.set(state, forKey: "state")
        }
    }
    
    @Published var welcomeNotDone: Bool {
        didSet {
        UserDefaults.standard.set(welcomeNotDone, forKey: "welcomeNotDone")
        }
    }
    
    @Published var clicks: Int {
        didSet {
            UserDefaults.standard.set(clicks, forKey: "clicks")
        }
    }
    
    @Published var notifsEnabled: Bool {
        didSet {
            UserDefaults.standard.set(notifsEnabled, forKey: "notifsEnabled")
        }
    }
    
    @Published var notifTime: Date {
        didSet {
            UserDefaults.standard.set(notifTime, forKey: "notifTime")
        }
    }
    
    @Published var dailyGoal: Int {
        didSet {
            UserDefaults.standard.set(dailyGoal, forKey: "dailyGoal")
        }
    }
    
    @Published var adsWatched: Int {
        didSet {
            UserDefaults.standard.set(adsWatched, forKey: "adsWatched")
        }
    }
    
    @Published var lastAdTime: Date {
         didSet {
             UserDefaults.standard.set(lastAdTime, forKey: "lastAdTime")
         }
     }

    
    @Published var streakValue: Float {
        didSet {
            UserDefaults.standard.set(streakValue, forKey: "streakValue")
        }
    }
    
    @Published var streakDays: Int {
        didSet {
            UserDefaults.standard.set(streakDays, forKey: "streakDays")
        }
    }
    
    @Published var todayStreak: Bool {
        didSet {
            UserDefaults.standard.set(todayStreak, forKey: "todayStreak")
        }
    }
    
    @Published var lastStreakTime: Date {
        didSet {
            UserDefaults.standard.set(lastStreakTime, forKey: "lastStreakTime")
        }
    }
    
    @Published var location: Int {
        didSet {
            UserDefaults.standard.set(location, forKey: "location")
        }
    }

    
     init() {
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
        self.area = UserDefaults.standard.object(forKey: "area") as? String ?? ""
        self.collectName = UserDefaults.standard.object(forKey: "collectName") as? Bool ?? false
        self.collectArea = UserDefaults.standard.object(forKey: "collectArea") as? Bool ?? false
        self.representative = UserDefaults.standard.object(forKey: "representative") as? String ?? ""
        self.state = UserDefaults.standard.object(forKey: "state") as? String ?? ""
        self.welcomeNotDone = UserDefaults.standard.object(forKey: "welcomeNotDone") as? Bool ?? true
        self.clicks = UserDefaults.standard.object(forKey: "clicks") as? Int ?? 0
        self.notifsEnabled = UserDefaults.standard.object(forKey: "notifsEnabled") as? Bool ?? false
        self.notifTime = UserDefaults.standard.object(forKey: "notifTime") as? Date ?? Date()
        self.dailyGoal = UserDefaults.standard.object(forKey: "dailyGoal") as? Int ?? 4
        self.adsWatched = UserDefaults.standard.object(forKey: "adsWatched") as? Int ?? 0
        self.lastAdTime = UserDefaults.standard.object(forKey: "lastAdTime") as? Date ?? Date()
        self.streakValue = UserDefaults.standard.object(forKey: "streakValue") as? Float ?? 0.0
        self.streakDays = UserDefaults.standard.object(forKey: "streakDays") as? Int ?? 0
        self.todayStreak = UserDefaults.standard.object(forKey: "todayStreak") as? Bool ?? false
        self.lastStreakTime = UserDefaults.standard.object(forKey: "lastStreakTime") as? Date ?? Date()
        self.location = UserDefaults.standard.object(forKey: "location") as? Int ?? 0
    }
}
