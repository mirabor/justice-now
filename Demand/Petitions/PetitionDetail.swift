//
//  ContactPhone.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices
import StoreKit

struct PetitionDetail: View {
    var item: petitionName
    
    @EnvironmentObject var settings: UserSettings
    
    @State var showSafari = false
    @State var urlString = "https://change.org"
    @State var clicked = false
    
    var body: some View {
        
            HStack{
            if clicked == false {
            Text("")
            .font(.caption)
            .padding(5)
            .background(Color.blue)
            .clipShape(Circle())
                .opacity(0.8)
            }
            else {
            Text("")
            .font(.caption)
            .padding(5)
            .background(Color.clear)
            .clipShape(Circle())
                }
        Spacer()
        .frame(width: 15)
        Button(action: {
            self.urlString = self.item.link
            self.showSafari = true
            self.clicked = true
            self.settings.clicks += 1
            if self.settings.clicks % 7 == 0 {
                SKStoreReviewController.requestReview()
            }
        }) {
            Text(item.name)
                .foregroundColor(.blue)
        }
        .sheet(isPresented: self.$showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
        }
    }
    }


