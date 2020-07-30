//
//  SenGenerated.swift
//  Demand
//
//  Created by Mira Yu on 6/13/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices
import StoreKit

struct RepGenerated: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State var showSafari = false
    @State var urlString = "https://change.org"
    @State var clicked = false
    
    @Environment(\.colorScheme) var colorScheme
    
     let pasteboard = UIPasteboard.general
    
    var body: some View {
        VStack {
            
        ScrollView {
            if colorScheme == .light {
            VStack(alignment: .leading, spacing: 3) {
                Text("\n      Dear Representative \(settings.representative),").fontWeight(.light)
                    .padding()
                .padding(.horizontal)
                Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(settings.houseTopicDescription)")
                    .fontWeight(.light)
                    .padding()
                    .padding(.horizontal)
                    .lineSpacing(8)
                Text ("Sincerely, \n\(settings.name)\n").fontWeight(.light)
                    .padding()
                    .padding(.horizontal)
                    .lineSpacing(8)
                }.background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                .padding())
            } else {
            VStack(alignment: .leading, spacing: 3) {
                Text("\n      Dear Representative \(settings.representative),").fontWeight(.light)
                    .padding()
                .padding(.horizontal)
                Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(settings.houseTopicDescription)").fontWeight(.light)
                    .padding()
                    .padding(.horizontal)
                    .lineSpacing(8)
                Text ("Sincerely, \n\(settings.name)\n").fontWeight(.light)
                    .padding()
                    .padding(.horizontal)
                    .lineSpacing(8)
                }.background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                .padding())
            }
              }
        .navigationBarTitle("Template", displayMode: .large)
            
        Button(action: {
            self.pasteboard.string = "Dear Representative \(self.settings.representative),\n       My name is \(self.settings.name), and I am a resident of \(self.settings.area). \(self.settings.houseTopicDescription)\nSincerely, \n\(self.settings.name)"
            self.settings.clicks += 1
            if self.settings.clicks % 7 == 0 {
                SKStoreReviewController.requestReview()
            }
                         })
                 {
                    Text("Copy Template")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .overlay(
                      RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 1))
        }.padding(EdgeInsets(top: 20, leading: 10, bottom: 5, trailing: 10))
        Button(action: {
            self.urlString = "https://\(self.settings.representative).house.gov"
            self.showSafari = true
            self.clicked = true
            self.settings.clicks += 1
            if self.settings.clicks % 10 == 0 {
                SKStoreReviewController.requestReview()
            }
                         })
                 {
        Text("Contact").bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 40)
                    .fill(Color.blue)
            )
            }.padding(EdgeInsets(top: 5, leading: 10, bottom: 20, trailing: 10))
        .sheet(isPresented: self.$showSafari) {
        SafariView(url:URL(string: self.urlString)!)
            }
        }
    }
}

struct RepGenerated_Previews: PreviewProvider {
    static var previews: some View {
        RepGenerated()
    }
}
