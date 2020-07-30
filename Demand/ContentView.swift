//
//  ContentView.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    @EnvironmentObject var settings: UserSettings

    
    var body: some View {
        
        ZStack {
            
            if settings.playAd == true {
                Ads()
                    .environmentObject(settings)
                    .zIndex(Double(settings.zIndexAds))
            }
        
    TabView {
        Home()
                .tabItem {
                    HStack {
                    Image(systemName: "house")
                    Text("Home")
                    }.padding()
                }.tag(1)
            ContactOfficials()
                .tabItem {
                    HStack {
                    Image(systemName: "paperplane")
                    Text("Contact")
                    }.padding()
                }.tag(2)
            SignPetitions()
                .tabItem {
                    HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Sign")
                    }.padding()
                }.tag(3)
            Donate()
                .tabItem {
                    HStack {
                Image(systemName: "dollarsign.circle")
                Text("Donate")
                    }.padding()
                }.tag(4)
            FetchBusinessData()
                .tabItem {
                    HStack {
                Image(systemName: "cart")
                Text("Support")
                    }.padding(.vertical)
                }.tag(5)
        }
        }
        .onReceive(settings.savedTimer) { timer in
            self.settings.playAd = true
                        print("Got the timer")
                     self.settings.zIndexAds = 0
                                       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
         .environment(\.colorScheme, .dark)
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

