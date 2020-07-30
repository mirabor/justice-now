//
//  StoreSheet.swift
//  Demand
//
//  Created by Mira Yu on 7/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI

struct StoreSheet: View {
    
    @ObservedObject var storeList: StoreList
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var intRating: Int = 0
    
    var body: some View {
        NavigationView {
            
            if storeList.noneFound == true {
                VStack {
                    Image(systemName: "exclamationmark.icloud")
                        .font(.system(size: 120))
                        .foregroundColor(.blue)
                        .padding()
                Text("None Found")
                    .font(.title).bold()
                    .padding(.top)
                Text("No Black-owned businesses matching your custom search filters were found near you.")
                .padding()
                    .lineLimit(nil)
                .navigationBarTitle("Stores")
                }
            } else {
            
        List {
            ForEach(storeList.stores, id: \.id) { store in
                ZStack (alignment: .leading) {
                    StoreListView(store: store)
                NavigationLink(destination: StoreDetail(store: store)) {
                    EmptyView()
                    }
                    }

            }
            }.padding()
        .navigationBarTitle("Stores")
                    .navigationBarItems(trailing:
                            
                            Button(action: {
                               self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Done").bold()
                            }
                )
    }
    }
}
}

struct StoreSheet_Previews: PreviewProvider {
    static var previews: some View {
        StoreSheet(storeList: StoreList())
    }
}


