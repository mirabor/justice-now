//
//  SignPetitions.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import SafariServices

struct SignPetitions: View {
     let petitionlabelPolicyReform = Bundle.main.decode([petitionLabel].self, from: "petitions.json")
    let petitionlabelJusticeForVictims = Bundle.main.decode([petitionLabel].self, from: "justiceforvictims.json")
    
    // whether or not to show the Safari ViewController
    @State var showSafari = false
    // initial URL string
    @State var urlString = "https://change.org"
    @State private var petitionType = 0
    var petitionTypes = ["All", "Policy", "Justice"]
    
    var body: some View {
        NavigationView {
            VStack{
            Picker(selection: self.$petitionType, label: Text("Choose a type of petition")) {
           ForEach(self.petitionTypes.indices, id: \.self){
               Text(self.petitionTypes[$0])
          }
       }.pickerStyle(SegmentedPickerStyle())
       .labelsHidden()
           .padding()
        .navigationBarTitle("Sign Petitions")
        .navigationViewStyle(StackNavigationViewStyle())
            
            if petitionType == 0 {
            List {
                ForEach(petitionlabelPolicyReform) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                             PetitionDetail(item: item)
                            }
                        }
                    }
                ForEach(petitionlabelJusticeForVictims) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                             PetitionDetail(item: item)
                            }
                    }
                }
                }.environment(\.defaultMinListRowHeight, 50)
                .listStyle(DefaultListStyle())
            }
            else if petitionType == 1 {
       List {
           ForEach(petitionlabelPolicyReform) { section in
                   Section(header: Text(section.name)) {
                       ForEach(section.items) { item in
                        PetitionDetail(item: item)
                       }
                   }
               }
           }.environment(\.defaultMinListRowHeight, 50)
                  .listStyle(DefaultListStyle())
           }
            
          else if petitionType == 2 {
        List {
            ForEach(petitionlabelJusticeForVictims) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                         PetitionDetail(item: item)
                        }
                    }
                }
            }.environment(\.defaultMinListRowHeight, 50)
                   .listStyle(DefaultListStyle())
            }
        }
    }
    }
}

    struct SafariView: UIViewControllerRepresentable {

        let url: URL

        func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }

        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

        }

    }

struct SignPetitions_Previews: PreviewProvider {
    static var previews: some View {
        SignPetitions()
        .environment(\.colorScheme, .dark)
    }
}
