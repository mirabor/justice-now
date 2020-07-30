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

struct DonateDetail: View {
    var item: donationName
    
    @EnvironmentObject var settings: UserSettings
    
    @State var showSafari = false
    @State var urlString = "https://change.org"
    
    var body: some View {
        Button(action: {
            self.urlString = self.item.link
            self.showSafari = true
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


