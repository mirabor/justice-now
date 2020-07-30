//
//  Home.swift
//  Demand
//
//  Created by Mira Yu on 6/7/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import StoreKit
import SafariServices

struct Home: View {
    
@EnvironmentObject var settings: UserSettings
    
    @State private var showingSheet = false
    
    @State private var isActive = false
    
    @Environment(\.colorScheme) var colorScheme
    
        @State private var edit = false
    
        @State private var adGoals = ["1", "2", "3", "4", "5"]
    
    @State var showNotifs = false
    
    
      static let appId = "1523183448"
    
    private func handleRate() {
      if let url = URL(string: "https://itunes.apple.com/app/id\(Self.appId)?mt=8&action=write-review"),
        UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
    }
    
    func shareButton() {
        let av = UIActivityViewController(activityItems: [URL(string: "https://apps.apple.com/us/app/id1523183448")!], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
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
            settings.streakValue = Float(settings.adsWatched)/Float((settings.dailyGoal + 1))
            

        } else {
            print("Oh darn, I didn't watch an ad today")
            print("I watched an ad at: \(settings.lastAdTime)")
            settings.streakValue = 0.0
        
        }
    }
    
    
    var body: some View {
        NavigationView{
            Group {
            VStack (alignment: .leading){

                Section()
                    {
                        Toggle(isOn: $settings.collectName.animation()) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                                    .font(.system(size: 24))
                                    .padding(.trailing, 5)
                                Text("Set Name").bold()
                            }.navigationBarTitle(Text("Home"), displayMode: .large)
                        }.padding(.top)
                        if settings.collectName == true {
                            if colorScheme == .light {
                            TextField("What's your name?", text: $settings.name)
                            .padding()
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                                .foregroundColor(.black)
                        .cornerRadius(6)
                            } else {
                                TextField("What's your name?", text: $settings.name)
                                .padding()
                            .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                            .cornerRadius(6)
                            }
                }

                        Toggle(isOn: $settings.collectArea.animation()) {
                            HStack {
                    Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                                .font(.system(size: 24))
                                .padding(.trailing, 5)
                     Text("Set Location").bold()
                            }
                        }.padding(.top)
                        if settings.collectArea == true {
                            if colorScheme == .light {
                    TextField("What's your city or town and state?", text: $settings.area)
                                .padding()
                            .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                        .foregroundColor(.black)
                            .cornerRadius(6)
                            } else {
                    TextField("What's your city or town and state?", text: $settings.area)
                                .padding()
                            .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                            .cornerRadius(6)
                            }
                }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 30))
                }
                Spacer()
                    .frame(height: 26)
                Group {
                if settings.todayStreak == false {
                    ZStack {
                        Image(systemName: "flame")
                            .foregroundColor(.blue)
                            .font(.system(size: 72))
                        Text("\(settings.streakDays)")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .offset(x: 1, y: 24)
                    }.padding()
                    } else if settings.todayStreak == true {
                        ZStack {
                             Image(systemName: "flame.fill")
                                 .foregroundColor(.blue)
                                .font(.system(size: 72, weight: .light))
                             
                             Text("\(settings.streakDays)")
                                  .fontWeight(.bold)
                                 .font(.system(size: 14))
                                 .foregroundColor(.blue)
                                 .offset(y: 24)
                    }.padding()
                    if settings.streakDays > 0 {
                        Text("\(settings.streakDays) day streak!")
                        .foregroundColor(.blue)
                            .font(.system(size: 14))
                            .fontWeight(.light)
                            .padding(.bottom)
                            .padding(.top, 5)
                    } else if settings.streakDays == 0 {
                      Text("You don't have a streak yet. Let's get started!")
                        .foregroundColor(.blue)
                        .fontWeight(.light)
                        .padding(.top, 5)
                        .font(.caption)
                        .padding(.bottom)
                        
//                    Text("Let's get started!")
//                        .foregroundColor(.blue)
//                        .font(.caption)
//                        .italic()
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .padding(.bottom)
                    }
                        }
                    Group {
                    HStack{
                    Spacer()
                        .frame(width: 25)
                    Text("Daily Goal")
                        .font(.system(size: 23)).bold()
                        .padding(.horizontal)
                        .onAppear {
                            self.resetDaily()
                        }
                    Button (action: {
                        self.edit.toggle()
                        }) {
                        Text("Edit")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        }
                    }
                    if edit == true {
                        Picker(selection: $settings.dailyGoal, label: Text("Choose number of ads to watch daily")) {
                        ForEach(adGoals.indices, id: \.self) {
                            Text(self.adGoals[$0])
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                            .frame(width: 220, height: 12)
                            .scaledToFit()
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                        .labelsHidden()
                        .padding(EdgeInsets(top: 7, leading: 0, bottom: 5, trailing: 0))
                    }
                        Text("\(settings.adsWatched)/\(settings.dailyGoal + 1) Ads")
                            .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .padding(.top)
                            .padding(.bottom, 5)
                        .font(.system(size: 18))
                            .foregroundColor(.blue)
                        
                        
                    ProgressBar()
                        .frame(height: 19)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                Spacer()
                }
            
                
//                Group {
//                    HStack {
//                        Spacer()
//
//                        ZStack {
//                            if colorScheme == .light {
//                        Text("Set notifications?")
//                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255, opacity: 1))
//                            .multilineTextAlignment(.center)
//                            .font(.system(size: 12))
//                            .padding()
//                            .offset(x: -33, y: 5)
//                            .shadow(color: Color(.black).opacity(0.25), radius: 3, x: 1, y: 2)
//                            .zIndex(1)
//                            } else {
//                        Text("Set notifications?")
//                            .foregroundColor(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
//                            .font(.system(size: 12))
//                            .multilineTextAlignment(.center)
//                            .padding()
//                            .offset(x: -33, y: 5)
//                            .shadow(color: Color(.black).opacity(0.25), radius: 3, x: 1, y: 2)
//                            .zIndex(1)
//                                    }
//                        Image(systemName: "bubble.right")
//                            .resizable()
//                            .font(.system(size: 10, weight: .ultraLight))
//                            .foregroundColor(Color(red: 145/255, green: 205/255, blue: 255/255))
//                            .offset(x: -30, y: 10)
//                           .frame(width: 110, height: 65)
//                            .shadow(color: Color(.black).opacity(0.2), radius: 2, x: 1, y: 2)
//                        }
//                        Spacer()
//                            .frame(width: 30)
//                    }
//
//                HStack {
//                Spacer()
//                    NavigationLink(destination: AdRevenue().environmentObject(settings), isActive: $isActive) {
//                    Button(action: {
//                    self.isActive = true
//                    self.resetDaily()
//                                    })
//                    {
//                    Image(systemName: "play.fill")
//                    .font(.system(size: 25))
//                    .padding(30)
//                        }.foregroundColor(Color.white)
//                     .background(LinearGradient(gradient: Gradient(colors: [.blue, Color(red: 145/255, green: 205/255, blue: 255/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .mask(Circle())
//                        .shadow(color: Color(.black).opacity(0.6), radius: 3, x: 0, y: 1)
//                        .padding()
//                }
//                    Spacer()
//                        .frame(width: 30)
//                }.padding(.bottom)
//                }
    }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarItems(
            leading:
            Button(action: {
                self.settings.welcomeNotDone = true
             }) {
                Text("Welcome")
                    .font(.body)
            },
            
            trailing:
            Group {
                HStack {
                        Button(action: {
                            self.handleRate()
                         }) {
                             Image(systemName: "star")
                            .font(.body)
                        }.padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 15))
                        
                        Button(action: {
                            self.shareButton()
                            }) {
                        Image(systemName: "square.and.arrow.up")
                                .font(.body)
                            }.padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 15))
                        
                        Button(action: {
                            self.showNotifs = true
                         }) {
                             Image(systemName: "alarm")
                        }.padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 15))
                        .sheet(isPresented: $showNotifs) {
                            Notifications()
                                    .environmentObject(self.settings)
                        }
                        
                        Button(action: {
                            self.showingSheet = true
                         }) {
                             Image(systemName: "info.circle")
                            .font(.body)
                        }.padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 5))
                            .sheet(isPresented: $showingSheet) {
                                HomeInfo()
                                .environmentObject(self.settings)
                        }
                    }
            }
            )
        }.sheet(isPresented: $settings.welcomeNotDone) {
                IntroductionView()
                    .environmentObject(self.settings)
        }
}
}

struct ProgressBar: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.settings.streakValue)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}
