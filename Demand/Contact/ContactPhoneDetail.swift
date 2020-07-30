//
//  ContactPhoneDetail.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import StoreKit

struct ContactPhoneDetail: View {
    var item: ContactPerson
    
@EnvironmentObject var settings: UserSettings
    
    @Environment(\.colorScheme) var colorScheme
    
    let pasteboard = UIPasteboard.general

    var body: some View {
            
        VStack {
            Spacer()
            .frame(height: 15)
      
            if item.representative == true {
                ContactRep()
                }
            else if item.senator == true {
                ContactSen()
                }
                
            else if item.byEmail == true {
                    ScrollView {
                        VStack {
                            if colorScheme == .light {
                        Text("To: \(item.price) <\(item.photoCredit)>")
                            .font(.headline).bold()
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                            .frame(height: 5)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("\n      Dear \(item.price),").fontWeight(.light)
                                .padding()
                            .padding(.horizontal)
                            Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(item.description)").fontWeight(.light)
                                .padding()
                                .padding(.horizontal)
                                .lineSpacing(8)
                            Text ("  Sincerely, \n  \(settings.name)\n").fontWeight(.light)
                                .padding()
                                .padding(.horizontal)
                                .lineSpacing(8)
                            }.background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                                .padding())
                            } else {
                        Text("To: \(item.price) <\(item.photoCredit)>")
                            .font(.headline).bold()
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                            .frame(height: 5)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("\n      Dear \(item.price),").fontWeight(.light)
                                .padding()
                            .padding(.horizontal)
                            Text("      My name is \(settings.name), and I am a resident of \(settings.area). \(item.description)").fontWeight(.light)
                                .padding()
                                .padding(.horizontal)
                                .lineSpacing(8)
                            Text ("  Sincerely, \n  \(settings.name)\n").fontWeight(.light)
                                .padding()
                                .padding(.horizontal)
                                .lineSpacing(8)
                            }.background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                                .padding())
                            }
                        }
                    }
                    .navigationBarTitle("Template", displayMode: .inline)
                        
                    Button(action: {
                        self.pasteboard.string = "\(self.item.photoCredit)"
                        self.settings.clicks += 1
                        if self.settings.clicks % 7 == 0 {
                            SKStoreReviewController.requestReview()
                                     }
                    })
                             {
                                Text("Copy Address")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .overlay(
                                  RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.blue, lineWidth: 1))
                    }.padding(EdgeInsets(top: 20, leading: 10, bottom: 5, trailing: 10))
                    Button(action: {
                         self.pasteboard.string = "Dear \(self.item.price),\n       My name is \(self.settings.name), and I am a resident of \(self.settings.area). \(self.item.description)\nSincerely, \n\(self.settings.name)"
                        self.settings.clicks += 1
                        if self.settings.clicks % 7 == 0 {
                            SKStoreReviewController.requestReview()
                        }
                                     })
                             {
                    Text("Copy Template").bold()
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(
                              RoundedRectangle(cornerRadius: 40)
                                .fill(Color.blue)
                        )
                        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 20, trailing: 10))
                    }
                              }
    }
    
}



