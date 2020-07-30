//
//  HomeInfo.swift
//  Demand
//
//  Created by Mira Yu on 6/24/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices

struct HomeInfo: View {
    
    @State var showSafari = false
    @State var urlString = "https://instagram.com/mirayu_"
    
         @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
             List {
                        Section(header: Text("Why Action Matters")) {
                        Text("Using Justice Now amplifies your support for the Black Lives Matter movement from one-time effort into powerful habits. Spreading awareness can only do so much, and systemic issues don't disappear after 24 hours. Anti-racism is an active process, which is why Justice Now aims to provide tangible ways to contribute and make a difference.").fontWeight(.light)
                         .fixedSize(horizontal: false, vertical: true)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 16))
                            .lineSpacing(4)
                    }
                 Section(header: Text("Credits")) {
                 Text("Justice Now was developed by Mira Yu with the goal of making long-lasting advocacy accessible. If you have any questions or concerns, you're welcome to reach out via my Instagram @mirayu_.").fontWeight(.light)
                     .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16))
                        .lineSpacing(4)
                            
                 }
                Section(header: Text("Feedback")) {
                     Text("Feel free to reach out with any feedback! If you have any suggestions or would like to report an error, you can contact the developer by following the link below.").fontWeight(.light)
                    .fixedSize(horizontal: false, vertical: true)
                       .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                       .frame(maxWidth: .infinity)
                       .font(.system(size: 16))
                       .lineSpacing(4)
                    Button(action: {
                            self.showSafari = true
                        }) {
                            Text("Contact Developer")
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                        }
                    .buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: self.$showSafari) {
                            SafariView(url:URL(string: self.urlString)!)
                                }
                           
                }
             }
                    .listStyle(GroupedListStyle())
                        .navigationBarTitle("About")
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

struct HomeInfo_Previews: PreviewProvider {
    static var previews: some View {
        HomeInfo()
    }
}
