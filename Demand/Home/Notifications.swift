//
//  Notifications.swift
//  Demand
//
//  Created by Mira Yu on 6/17/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    
    func addNotification() {
        
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "It's the time for change."
            content.body = "Keep your daily streak!"
            content.sound = UNNotificationSound.default

            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: self.settings.notifTime)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

       center.getNotificationSettings { settings in
           if settings.authorizationStatus == .authorized {
               addRequest()
           } else {
               center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                   if success {
                       addRequest()
                   } else {
                       print("D'oh")
                   }
               }
           }
       }
    }
    
  @Environment(\.presentationMode) private var presentationMode
    
  @EnvironmentObject var settings: UserSettings
    
    var body: some View {
    NavigationView {
        VStack {
        Spacer()
            .frame(height: 15)
        Form {
            Toggle(isOn: $settings.notifsEnabled.animation()) {
              Text("Enable Notifications").bold()
    }.padding()
    

        DatePicker("Choose time of notif", selection: $settings.notifTime, displayedComponents: .hourAndMinute)
        .labelsHidden()
        .padding()
            
        }
            }
    .navigationBarTitle("Notifications")
            .navigationBarItems(trailing:
            
            Button(action: {
                if self.settings.notifsEnabled == true {
                self.addNotification()
                } else {
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                }
               self.presentationMode.wrappedValue.dismiss()
            }) {
              Text("Save")
            }
            
            )
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
