//
//  Donate.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI

struct Donate: View {
    let memorialfunds = Bundle.main.decode([donationLabel].self, from: "donations.json")
     let bailfunds = Bundle.main.decode([donationLabel].self, from: "bailfunds.json")
    let organizations = Bundle.main.decode([donationLabel].self, from: "organizations.json")
    
    @State private var adRevenue: Bool = false
    
    @State private var donationType = 0
    var donationTypes = ["Memorial", "Bail", "Organizations"]
    
    @State private var isActive = false
    
    @EnvironmentObject var settings: UserSettings
    
    func resetDaily() {
        
        if settings.streakDays > 0 {
              let now = Calendar.current.dateComponents(in: .current, from: Date())
              let yesterday = DateComponents(year: now.year, month: now.month, day: now.day! - 1)
            let today = DateComponents(year: now.year, month: now.month, day: now.day!)
              let last = Calendar.current.dateComponents(in: .current, from: settings.lastStreakTime)
              if last.day == yesterday.day {
              } else if last.day == today.day {
              } else {
                settings.streakDays = 0
        }
        }
        
        let isToday = Calendar.current.isDateInToday(settings.lastAdTime)
        
        if isToday == true {
            print("No biggie! It's within the same day of me last watching an ad")
            print("I watched an ad at: \(settings.lastAdTime)")
            settings.streakValue = Float(settings.adsWatched)/5
            if settings.adsWatched >= (settings.dailyGoal+1) {
                settings.todayStreak = true
            } else {
                settings.todayStreak = false
            }
            

        } else {
            print("Oh darn, I didn't watch an ad today (yet)")
            print("I watched an ad at: \(settings.lastAdTime)")
            settings.streakValue = 0.0
        }
    }
    
    var body: some View {
            
NavigationView {
    
    VStack {
//        NavigationLink(destination: AdRevenue().environmentObject(settings), isActive: $isActive) {
//                Button(action: {
//                    self.isActive = true
//                    self.resetDaily()
//                            })
//                    {
//                        Text("Watch Ads")
//                          .foregroundColor(.white)
//                          .font(.headline)
//                          .multilineTextAlignment(.center)
//                          .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
//                          .padding()
//                          .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
//                              .fill(Color.blue))
//                     }
//        }.padding()
        
        Picker(selection: self.$donationType, label: Text("Choose a type of donation")) {
        ForEach(self.donationTypes.indices, id: \.self){
                Text(self.donationTypes[$0])
           }
        }.pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
            .padding()
        .navigationBarTitle("Donate")
        .navigationViewStyle(StackNavigationViewStyle())
             
             if donationType == 0 {
             List {
                 ForEach(memorialfunds) { section in
                         Section(header: Text(section.name)) {
                             ForEach(section.items) { item in
                              DonateDetail(item: item)
                             }
                         }
                     }
                 }.environment(\.defaultMinListRowHeight, 50)
                 .listStyle(GroupedListStyle())
             }
             else if donationType == 1 {
        List {
            ForEach(bailfunds) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                         DonateDetail(item: item)
                        }
                    }
                }
            }.environment(\.defaultMinListRowHeight, 50)
                   .listStyle(GroupedListStyle())
            }
             
           else if donationType == 2 {
         List {
             ForEach(organizations) { section in
                     Section(header: Text(section.name)) {
                         ForEach(section.items) { item in
                          DonateDetail(item: item)
                         }
                     }
                 }
             }.environment(\.defaultMinListRowHeight, 50)
                    .listStyle(GroupedListStyle())
             }
    }

    
            }
    
}
}

struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate()
        .environment(\.colorScheme, .dark)
    }
}

