//
//  DonateInfo.swift
//  Demand
//
//  Created by Mira Yu on 6/18/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices

struct DonateInfo: View {
    
    @State var showSafari = false
    @State var urlString = "https://instagram.com/mirayu_"
    
     @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
        List {
            Section(header: Text("Why watch ads??")) {
                VStack{
            Text("Although app development is fun, it's also challenging and time-consuming. Your support goes toward making new apps that spread accessibility to advocacy. Donating through Justice Now only takes 15 seconds and keeps you accountable for visiting the app and making a difference each day.").fontWeight(.light)
             .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .frame(maxWidth: .infinity)
                .font(.system(size: 16))
                .lineSpacing(4)
                    
            Button(action: {
                self.showSafari = true
            }) {
                Text("Contact the Developer")
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 16))
            }
                .padding()
            .sheet(isPresented: self.$showSafari) {
                SafariView(url:URL(string: self.urlString)!)
                    }
            }
        }
            Section(header: Text("How do I set daily notifications?")) {
            Text("From the Ad Donation screen, click the first icon in the upper right corner to enable notifications and select what time you would like to receive them.").fontWeight(.light)
                .fixedSize(horizontal: false, vertical: true)
                   .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                   .frame(maxWidth: .infinity)
                   .font(.system(size: 16))
                   .lineSpacing(4)
            }
            }
        .listStyle(GroupedListStyle())
            .navigationBarTitle("About Ad Donation")
            .navigationBarItems(trailing:
                    
                    Button(action: {
                       self.presentationMode.wrappedValue.dismiss()
                    }) {
                      Text("Done")
                    }
        )
}
    }
}

struct DonateInfo_Previews: PreviewProvider {
    static var previews: some View {
        DonateInfo()
    }
}
