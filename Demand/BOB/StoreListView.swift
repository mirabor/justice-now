//
//  StoreListView.swift
//  Demand
//
//  Created by Mira Yu on 7/6/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import CDYelpFusionKit
import URLImage

struct StoreListView: View {
    
    var store: CDYelpBusiness
    
    var body: some View {
        
        HStack {
              ImageView(store: store)
        VStack(alignment: .leading) {
            HStack {
            Text("\(store.name!)")
                .bold()
                
                if store.price != nil {
            Text("\(store.price!)")
                .font(.caption)
                .padding(5)
                    .background(Color(red: 145/255, green: 205/255, blue: 255/255))
                .clipShape(Circle())
                .foregroundColor(.white)
                }
                if store.categories != nil {
        ForEach(0 ..< store.categories!.count) { category in
            if self.store.categories![category].alias == "vegan" {
                                                       Text("VN")
                                                       .font(.caption)
                                                       .fontWeight(.black)
                                                       .padding(5)
                                                           .background(Color.yellow)
                                                       .clipShape(Circle())
                                                       .foregroundColor(.white)
                                                   }
                           if self.store.categories![category].alias == "vegetarian" {
                                                       Text("VG")
                                                       .font(.caption)
                                                       .fontWeight(.black)
                                                       .padding(5)
                                                           .background(Color.green)
                                                       .clipShape(Circle())
                                                       .foregroundColor(.white)
                                                   }
                           if self.store.categories![category].alias == "gluten_free" {
                                                       Text("GF")
                                                       .font(.caption)
                                                       .fontWeight(.black)
                                                       .padding(5)
                                                           .background(Color.purple)
                                                       .clipShape(Circle())
                                                       .foregroundColor(.white)
                                                   }
                           if self.store.categories![category].alias == "kosher" {
                                                       Text("K")
                                                       .font(.caption)
                                                       .fontWeight(.black)
                                                       .padding(5)
                                                           .background(Color.blue)
                                                       .clipShape(Circle())
                                                       .foregroundColor(.white)
                                                   }
                           if self.store.categories![category].alias == "halal" {
                                                       Text("H")
                                                       .font(.caption)
                                                       .fontWeight(.black)
                                                       .padding(5)
                                                           .background(Color.red)
                                                       .clipShape(Circle())
                                                       .foregroundColor(.white)
                                                   }
        }
            }
                }

            if Int((store.distance!)/1609.34) == 1 {
            Text("1 mile away")
                    .font(.caption)
                    .fontWeight(.light)
            } else if Int((store.distance!)/1609.34) == 0 {
            Text("<1 mile away")
                    .font(.caption)
                    .fontWeight(.light)
            }
            else {
            Text("\(Int((store.distance!)/1609.34)) miles away")
                .font(.caption)
                .fontWeight(.light)
            }
            
            if store.rating != nil {
            HStack {
            ForEach(0 ..< Int(store.rating!)) { number in
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                
            }
                ForEach(0 ..< (5-(Int(store.rating!)))) { number in
                Image(systemName: "star")
                    .font(.caption)
                    .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
            }
            }.padding(.bottom)
            }
        }
            }.padding(.top)
    }
}

struct ImageView: View {
    
    var store: CDYelpBusiness
    
    var body: some View {
        
        VStack {
        if store.imageUrl != nil {
            URLImage(store.imageUrl!,
            delay: 0.25,
            processors: [ Resize(size: CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale) ],
            content:  {
                $0.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .frame(width: 50, height: 50)
                .offset(x: -13)
            })
    }
        }
    }
}

