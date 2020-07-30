//
//  StoreDetail.swift
//  Demand
//
//  Created by Mira Yu on 6/29/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import CDYelpFusionKit
import MapKit

struct StoreDetail: View {
    
    var store: CDYelpBusiness
    
    func showLocation() {
        let coordinate = CLLocationCoordinate2DMake((store.coordinates?.latitude)!,(store.coordinates?.longitude)!)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = "\(store.name ?? "Black-owned Business")"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    func showLocationWalking() {
        let coordinate = CLLocationCoordinate2DMake((store.coordinates?.latitude)!,(store.coordinates?.longitude)!)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = "\(store.name ?? "Black-owned Business")"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking])
    }
    
    func showLocationTransit() {
        let coordinate = CLLocationCoordinate2DMake((store.coordinates?.latitude)!,(store.coordinates?.longitude)!)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = "\(store.name ?? "Black-owned Business")"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeTransit])
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        
        ScrollView(.vertical) {
        VStack {
            
    if store.imageUrl != nil {
                ImagesScroll(store: store)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 12)
            }
            
            
    Text("\(store.name ?? "No Name")")
        .font(.title).bold()
        .padding(.horizontal)
                .navigationBarItems(trailing:
                   
                    HStack {
                         if colorScheme == .light {
                        Button(action: {
                            self.showLocation()
                        }) {
                            Image(systemName: "car.fill")
                            .padding(11)
                            .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                                  .mask(Circle())
                                  .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                        }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 15))
                        Button(action: {
                            self.showLocationWalking()
                        }) {
                            Image(systemName: "person.fill")
                            .padding(11)
                            .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                                  .mask(Circle())
                                  .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                        }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 15))
                        Button(action: {
                            self.showLocationTransit()
                        }) {
                            Image(systemName: "tram.fill")
                            .padding(11)
                            .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                                  .mask(Circle())
                                  .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                        }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 0))
                    }
                        else {
                    Button(action: {
                        self.showLocation()
                    }) {
                        Image(systemName: "car.fill")
                        .padding(11)
                        .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                              .mask(Circle())
                              .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                    }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 15))
                    Button(action: {
                        self.showLocationWalking()
                    }) {
                        Image(systemName: "person.fill")
                        .padding(11)
                        .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                              .mask(Circle())
                              .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                    }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 15))
                    Button(action: {
                        self.showLocationTransit()
                    }) {
                        Image(systemName: "tram.fill")
                        .padding(11)
                        .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                              .mask(Circle())
                              .shadow(color: Color(.black).opacity(0.35), radius: 1, x: 0, y: 0)
                    }.padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
            )
            
            
    if store.location != nil {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                       .foregroundColor(.blue)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.trailing, 3)
                    VStack {
                    Text("\((self.store.location?.displayAddress![0])!)")
                    .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("\((self.store.location?.displayAddress![1])!)")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                    }.padding(.trailing, 10)
                    Text("   ")
                }
            }
            
    VStack (spacing: 0) {
    if store.coordinates != nil {
        Button(action:
            showLocation) {
                
        HStack {
            if colorScheme == .light {
            Image(systemName: "map")
                .foregroundColor(.blue)
                .font(.system(size: 16, weight: .semibold))
            .padding(14)
                .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                     .mask(Circle())
                     .shadow(color: Color(.black).opacity(0.6), radius: 3, x: 0, y: 1)
            } else {
                Image(systemName: "map")
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .semibold))
                .padding(14)
                    .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                         .mask(Circle())
                         .shadow(color: Color(.black).opacity(0.6), radius: 3, x: 0, y: 1)
            }
            Text("Get Directions")
            .font(.system(size: 17, weight: .semibold))
            .padding(.trailing, 24)
        }
        }
            }
            
    if Int((store.distance!)/1609.34) == 1 {
        HStack {
            Image(systemName: "location")
                .font(.caption)
            .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
        Text("1 mile away")
            .fontWeight(.light)
            .font(.caption)
        }
    } else if Int((store.distance!)/1609.34) == 0 {
            HStack {
                Image(systemName: "location")
                    .font(.caption)
                .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
            Text("<1 mile away")
                .fontWeight(.light)
                .font(.caption)
            }
        }
         else {
        HStack {
            Image(systemName: "location")
            .font(.caption)
            .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
        Text("\(Int((store.distance!)/1609.34)) miles away")
            .fontWeight(.light)
                .font(.caption)
            }
            }
    }.padding(.bottom, 6)
            
    if store.categories != nil {
            CategoryView(store: store)
        }
            
    if store.rating != nil {
                HStack {
                Text("\(store.rating!, specifier: "%.1f")")
                    .bold()
                ForEach(0 ..< Int(store.rating!)) { number in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                    
                }
                    ForEach(0 ..< (5-(Int(store.rating!)))) { number in
                    Image(systemName: "star")
                        .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                }
            }
            }
            
            
            
    if store.transactions != nil {
          TransactionView(store: store)
              .padding(.top, 5)
              }
            
            
    if store.phone != nil {
            
            Button(action: {
                    let formattedString = "tel://" + self.store.phone!
                let url: NSURL = URL(string: formattedString)! as NSURL

                UIApplication.shared.open(url as URL)
                

            }) {
            
            HStack {
                if colorScheme == .light {
            
            Image(systemName: "phone.fill")
               .font(.system(size: 25, weight: .ultraLight))
                .padding(16)
               .foregroundColor(.blue)
                .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                     .mask(Circle())
                     .shadow(color: Color(.black).opacity(0.6), radius: 3, x: 0, y: 1)
                }
                else {
            Image(systemName: "phone.fill")
               .font(.system(size: 25, weight: .ultraLight))
                .padding(16)
               .foregroundColor(.blue)
                .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                     .mask(Circle())
                     .shadow(color: Color(.black).opacity(0.6), radius: 3, x: 0, y: 1)
                }
            
            Text("\(store.displayPhone ?? "No Phone Number")")
                .padding(.leading, 3)
                .padding(.bottom, 5)
                .padding(.trailing, 10)
                .shadow(color: Color(.black).opacity(0.15), radius: 2, x: 0, y: 3)
            Text("   ")
                .padding(.leading, 10)
                }.padding(5)
            }
            }
            
            
        Spacer()
            
            
            
            }.frame(maxWidth: .infinity)
        
    }
}

struct CategoryView: View {
    
    var store: CDYelpBusiness
    
    var body: some View {
        
        
        VStack (spacing: 6) {
            if store.categories!.count >= (3) {
        HStack(alignment: .center, spacing: 6) {
                    ForEach(0 ..< (store.categories!.count-1)) { category in
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                                .font(.system(size: 17, weight: .bold))
                        Text("\(self.store.categories![category].title!)")
                              .fontWeight(.semibold)
                            .lineLimit(1)
                        }.padding(.trailing, 6)
            }
                            }.padding(.horizontal)
    HStack {
            Image(systemName: "checkmark")
                .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                .font(.system(size: 17, weight: .bold))
        Text("\((self.store.categories?.last?.title)!)")
              .fontWeight(.semibold)
        .lineLimit(1)
    }.padding(.horizontal)
    .frame(maxWidth: 350)
            }
        else {
        HStack(alignment: .center, spacing: 6) {
                    ForEach(0 ..< store.categories!.count) { category in
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                                .font(.system(size: 17, weight: .bold))
                        Text("\(self.store.categories![category].title!)")
                              .fontWeight(.semibold)
                            .lineLimit(1)
                        }.padding(.trailing, 6)
            }
                            }.padding(.horizontal)
                .padding(.bottom, 5)
            }
        }
}
}

struct TransactionView: View {
    
    var store: CDYelpBusiness
    
    var body: some View {
        
        HStack {
            
                if store.price != nil {
                    HStack {
                  Image(systemName: "creditcard")
                        .foregroundColor(Color(red: 51/255, green: 153/255, blue: 255/255))
                        Text("\(store.price!)")
                        .padding(.trailing, 6)
                    }
                }
                ForEach(0 ..< store.transactions!.count) { transaction in
                        if self.store.transactions![transaction] == "delivery" {
                    HStack {
                    Image(systemName: "bell")
                        .foregroundColor(.blue)
                    Text("Delivery")
                            .italic()
                                .padding(.trailing, 6)
                        }
                    }
                        if self.store.transactions![transaction] == "pickup" {
                    HStack {
                     Image(systemName: "bag")
                         .foregroundColor(.blue)
                    Text("Pickup")
                            .italic()
                            .padding(.trailing, 6)
                        }
                    }
                }
            }
    }
    }
}
