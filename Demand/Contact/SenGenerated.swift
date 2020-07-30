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

extension String {
    func containsAny(of array: [String]) -> String {
        for item in array {
            if self.contains(item) {
            return String(self.dropFirst(item.count))
            }
        }
        return String()
    }
}

struct SenGenerated: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State var showSafari = false
    @State var urlString = "https://change.org"
    @State var clicked = false
    
    @Environment(\.colorScheme) var colorScheme
    
     let pasteboard = UIPasteboard.general
    let firstNames = ["Lisa ", "Richard C. ", "John ","Kyrsten ", "Dianne ", "Michael F. ", "Richard ", "Tom ", "Marco ", "Johnny ", "Mazie ", "Chuck ", "Mike ", "Dick ", "Todd ", "Pat ", "Mitch ", "Bill ", "Elizabeth ", "Benjamin L. ", "Susan ", "Debbie ", "Amy ", "Roy ", "Roger ", "Jon ", "Richard ", "John ", "Deb ", "Jeanne ", "Robert ", "Tom ", "Catherine ", "Charles E. ", "Sherrod ", "James M. ", "Ron ", "Robert P. ", "Jack ", "Lindsey ", "John ", "Lamar ", "John ", "Mike ", "Mark R. ", "Patrick ", "Patty ", "Ron ", "Joseph ", "John ", "Dan ", "Doug ", "Tom ", "Martha ", "Kamala ", "Cory ", "Chris ", "Chris ", "Rick ", "David ", "Brian ", "Joni ", "James E. ", "Tammy ", "Mike ", "Jerry ", "Rand ", "John ", "Ed ", "Chris ", "Angus ", "Gary ", "Tina ", "Josh ", "Cindy ", "Steve ", "Thom ", "Kevin ", "Ben ", "Maggie ", "Cory ", "Martin ", "Jacky ", "Kirsten ", "Rob ", "James ", "Jeff ", "Pat ", "Sheldon ", "Tim ", "Mike ", "Marsha ", "Ted ", "Mitt ", "Tim ", "Bernie ", "Maria ", "Tammy ", "Shelley Moore ", "Mike "]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 3)
            .navigationBarTitle("Template")
        ScrollView {
            if colorScheme == .light {
            VStack(alignment: .leading, spacing: 3) {
                Text("\n      Dear Senator \(self.settings.senatorChoice.containsAny(of: self.firstNames)),").fontWeight(.light)
                    .padding()
                .padding(.horizontal)
                Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(settings.topicDescription)").fontWeight(.light)
                    .padding()
                    .padding(.horizontal)
                    .lineSpacing(8)
                Text ("Sincerely, \n\(settings.name)\n").fontWeight(.light)
                    .padding()
                    .lineSpacing(8)
                    .padding(.horizontal)
                }.background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                .padding())
            } else {
            VStack(alignment: .leading, spacing: 3) {
                Text("\n      Dear Senator \(self.settings.senatorChoice.containsAny(of: self.firstNames)),").fontWeight(.light)
                    .padding()
                .padding(.horizontal)
                Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(settings.topicDescription)").fontWeight(.light)
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
            Button (action:
                {
                self.pasteboard.string = "Dear Senator \(self.settings.senatorChoice.containsAny(of: self.firstNames)),\n       My name is \(self.settings.name), and I am a resident of \(self.settings.area). \(self.settings.topicDescription)\n Sincerely, \n\(self.settings.name)"
                self.settings.clicks += 1
                if self.settings.clicks % 7 == 0 {
                    SKStoreReviewController.requestReview()
            }
            }) {
                Text("Copy Template")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .overlay(
                      RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 1)
                    )
                .foregroundColor(.blue)
            }.padding(EdgeInsets(top: 20, leading: 10, bottom: 5, trailing: 10))
            Button (action:
                {
                self.urlString = "https://\(self.settings.senatorChoice.containsAny(of: self.firstNames)).senate.gov"
                self.showSafari = true
                self.clicked = true
                self.settings.clicks += 1
                if self.settings.clicks % 7 == 0 {
                    SKStoreReviewController.requestReview()
            }
            }) {
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

struct SenGenerated_Previews: PreviewProvider {
    static var previews: some View {
        SenGenerated()
    }
}
