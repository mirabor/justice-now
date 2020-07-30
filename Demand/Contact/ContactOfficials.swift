//
//  ContactOfficials.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI

struct ContactOfficials: View {
       let contactlabel = Bundle.main.decode([ContactLabel].self, from: "contactofficials.json")
    
    @State private var isActive = false
    @State private var isActive2 = false
    
    @EnvironmentObject var settings: UserSettings
    
    
        @State private var showingAlert = false
    
      let timer = Timer.publish(every: 15, tolerance: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
         NavigationView {
                
            
            VStack{
            HStack (spacing: 15) {
                NavigationLink(destination: ContactSen()) {
                         Text("My Senator")
                             .font(.headline).bold()
                         .multilineTextAlignment(.center)
                         .foregroundColor(.blue)
                         .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(Color.blue, lineWidth: 3)
                                .shadow(color: Color(.black).opacity(0.15), radius: 1.8, x: 1, y: 2)
                        )
                    
                }
                NavigationLink(destination: ContactRep()) {
                         Text("My Representative")
                             .font(.headline).bold()
                         .multilineTextAlignment(.center)
                         .foregroundColor(.blue)
                         .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(Color.blue, lineWidth: 3)
                            .shadow(color: Color(.black).opacity(0.15), radius: 1.8, x: 1, y: 2)
                        )
                }.padding()
            }
            List {
                ForEach(contactlabel) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                                ContactPhone(item: item)
                            }
                        }
                    }
                }.environment(\.defaultMinListRowHeight, 50)
            .navigationBarTitle("Contact Officials")
                .listStyle(GroupedListStyle())
            .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(trailing:
                        Button(action: {
                            self.showingAlert = true
                        }) {
                            Image(systemName: "questionmark.circle")
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Why contact officals?"), message: Text("Contacting your elected representatives in Congress is the most effective way to have your voice heard. To legislators, your communication represents not only your position but also many other constituents who did not take the time to write. By showing how strongly you feel about the issue, your voice can influence their actions."), dismissButton: .default(Text("Got it!")))
                        }
                        )
                }
        }
    }



struct ContactOfficials_Previews: PreviewProvider {
    static var previews: some View {
        ContactOfficials()
    }
}
}
