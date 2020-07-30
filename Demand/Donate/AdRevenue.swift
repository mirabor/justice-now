//
//  AdRevenue.swift
//  Demand
//
//  Created by Mira Yu on 6/5/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices

struct AdRevenue: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State private var isActive = false
    @State var playAd = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showSafari = false
    @State var urlString = "https://secure.actblue.com/donate/bail_funds_george_floyd"
    
    @State var showNotifs = false
    @State var donateInfo = false
    
    @State private var showingAlert = false
    
    @State private var edit = false
    
    @State private var adGoals = ["1", "2", "3", "4", "5"]
    
    
    var body: some View {
        
        ZStack {
        VStack{

            Group {
        Button(action: {
            self.settings.streakValue = Float(self.settings.adsWatched)/5
            self.playAd = true
            self.settings.zIndexAds = 0
            // set zIndexAd to 2
            self.settings.lastAdTime = Date()
            if self.settings.adsWatched >= (self.settings.dailyGoal+1) {
                self.settings.todayStreak = true
                }  else {
                self.settings.todayStreak = false
                           }

          })
    {
        HStack {
            Image(systemName: "play.circle")
                .font(.system(size: 40))
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 5, trailing: 0))
            Text("Watch Ad")
            .fontWeight(.semibold)
            .font(.title)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 5, trailing: 15))
        }.padding()
         .foregroundColor(.white)
         .background(Color.blue)
         .cornerRadius(40)
            
        }.navigationBarTitle("Ad Donation", displayMode: .inline)
            .padding(.top)
            .navigationBarItems(trailing:
            HStack{
            Button(action: {
                self.showNotifs = true
             }) {
                 Image(systemName: "alarm")
                    .font(.system(size: 20))
                    .padding(.bottom)
            }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 5))
                .sheet(isPresented: $showNotifs) {
                    Notifications().environmentObject(self.settings)
            }
            Button(action: {
                 self.donateInfo = true
              }) {
                  Image(systemName: "info.circle")
                     .font(.system(size: 20))
                     .padding(.bottom)
             }.padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 5))
                 .sheet(isPresented: $donateInfo) {
                     DonateInfo()
                                    }
                    }
                )
//            Button(action: {
//                self.showingAlert = true
//            }) {
//                Text("How do I watch another ad?")
//                    .foregroundColor(.blue)
//                    .italic()
//            //    .font(.caption)
//                .font(.system(size: 14))
//            }
//            .padding(EdgeInsets(top: 23, leading: 0, bottom: 28, trailing: 0))
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("Watching multiple ads"), message: Text("Go back and reload this page by clicking Support the Developer"), dismissButton: .default(Text("Got it!").bold()))
//            }
            Spacer()
                .frame(height: 30)
            }
            if self.settings.todayStreak == false {
            ZStack {
                Image(systemName: "flame")
                    .foregroundColor(.blue)
                    .font(.system(size: 100))
                Text("\(settings.streakDays)")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .offset(x: 1, y: 31)
                }.padding()
            } else if self.settings.todayStreak == true {
                ZStack {
                     Image(systemName: "flame.fill")
                         .foregroundColor(.blue)
                        .font(.system(size: 100, weight: .light))
                     
                     Text("\(settings.streakDays)")
                          .fontWeight(.bold)
                         .font(.system(size: 20))
                         .foregroundColor(.blue)
                         .offset(y: 30)
                }.padding()
                }
            Group {
            HStack{
            Spacer()
                .frame(width: 25)
            Text("Daily Goal")
                .font(.title).bold()
                .padding()
            Button (action: {
                self.edit = true
                }) {
                Text("Edit")
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                }
            }
            if edit == true {
                Picker(selection: $settings.dailyGoal, label: Text("Choose number of ads to watch daily")) {
                ForEach(self.adGoals.indices, id: \.self) {
                    Text(self.adGoals[$0])
                }
                
            }.pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            Text("\(settings.adsWatched)/\(settings.dailyGoal + 1) Ads")
                .frame(alignment: .leading)
            
           Spacer()
                .frame(height: 15)
            ProgressBar()
                .frame(height: 20)
                .padding(.horizontal)
            Spacer()
                .frame(height: 30)
            }
            if settings.streakDays > 0 {
                Text("\(settings.streakDays) day streak!")
                .foregroundColor(.blue)
                .italic()
                    .padding(.bottom)
            } else {
              Text("You don't have a streak yet.")
                .foregroundColor(.blue)
                .italic()
            Text("Let's get started!")
                .foregroundColor(.blue)
                .italic()
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
            }
        }.zIndex(1)
    if playAd == true {
                Ads().environmentObject(settings)
                    .zIndex(Double(settings.zIndexAds))
            }
    }
}
}

struct AdRevenue_Previews: PreviewProvider {
    static var previews: some View {
        AdRevenue()
    }
}

//struct ProgressBar: View {
//    @EnvironmentObject var settings: UserSettings
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
//                    .opacity(0.3)
//                    .foregroundColor(Color(UIColor.systemTeal))
//
//                Rectangle().frame(width: min(CGFloat(self.settings.streakValue)*geometry.size.width, geometry.size.width), height: geometry.size.height)
//                    .foregroundColor(Color(UIColor.systemBlue))
//                    .animation(.linear)
//            }.cornerRadius(45.0)
//        }
//    }
//}
