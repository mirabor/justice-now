//
//  FetchBusinessData.swift
//  Demand
//
//  Created by Mira Yu on 6/27/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import CDYelpFusionKit


class StoreList: ObservableObject {
    
     @ObservedObject var locationViewModel = LocationViewModel()

    @Published var stores: [CDYelpBusiness] = []
    @Published var isLoading = false
    
    @Published var noneFound = false
    
   @Published var category1: CDYelpBusinessCategoryFilter = .restaurants
    @Published var cuisine: CDYelpBusinessCategoryFilter = .restaurants
    @Published var dietary: CDYelpBusinessCategoryFilter = .restaurants
    @Published var specialty: CDYelpBusinessCategoryFilter = .restaurants
    @Published var diningType: CDYelpBusinessCategoryFilter = .restaurants
    
    @Published var categories: [CDYelpBusinessCategoryFilter] = []
    
    @Published var priceTiers: [CDYelpPriceTier] = []
    @Published var doubleRadius: Double = 10000
    @Published var radius: Int = 10000
    @Published var sortBy: CDYelpBusinessSortType = .rating
    @Published var openNow: Bool = true
    @Published var optionLoad: Int = 40
    @Published var searchTerms: String = "Black Owned"
    @Published var customSearch: String = ""
    
        @Published var FoB = 0
    
    @Published var dietaryBool = false
      @Published var specialtyBool = false
      @Published var cuisineBool = false
      @Published var businessBool = false
    @Published var diningTypeBool = false
    @Published var priceRangeBool = false
    @Published var customSearchBool = false
    

    let yelpAPIClient = CDYelpAPIClient(apiKey: "eJPY7XWDbnX8nDjNdTww78rCkKy54PUEYlBThseIPUo0WPq5sUDbemCGJJyZAEeUEgSD0InyV2hGWLinQQdVnlO7eZThMN-6kHe5CYButT6LnxA0MQUJHJktqbj3XnYx")

    func fetchStores() {
        yelpAPIClient.cancelAllPendingAPIRequests()
        self.noneFound = false

        yelpAPIClient.searchBusinesses(byTerm: searchTerms,
                                       location: nil,
                                       latitude: locationViewModel.userLatitude,
                                       longitude: locationViewModel.userLongitude,
                                       radius: radius,
                                       categories: categories,
                                       locale: .english_unitedStates,
                                       limit: optionLoad,
                                       offset: 0,
                                       sortBy: sortBy,
                                       priceTiers: priceTiers,
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: nil) { (response) in

          if let response = response,
              let businesses = response.businesses,
              businesses.count > 0 {
            self.stores = businesses
          } else {
            print("No stores found")
            self.noneFound = true
            }
        }
    }
}


struct FetchBusinessData: View {

    @ObservedObject var storeList = StoreList()
    
            @Environment(\.colorScheme) var colorScheme
    
    @State var businessTypeNumber: Int = 0
    @State var restaurantTypeNumber: Int = 0
    @State var dietaryNumber: Int = 0
    @State var specialtyNumber: Int = 0
    @State var diningTypeNumber: Int = 0
    @State var sortByNumber: Int = 0
    
    @State private var priceRangeDouble: Double = 4
    
    @State private var whyAlert = false
    
    @State private var showSheet = false
    
    var foodOrBusiness = ["Food", "Business"]
    
    var restaurantTypes = ["African", "Senegalese", "South African", "New American", "Traditional American", "Arabian", "Cajun And Creole", "Haitian", "Ethiopian", "Egyptian", "Moroccan", "Georgian", "Sri Lankan", "Southern"]
    var restaurantCategoryTypes: [CDYelpBusinessCategoryFilter] = [.african, .senegalese, .southAfrican, .newAmerican, .traditionalAmerican, .arabian, .cajunAndCreole, .haitian, .ethiopian, .egyptian, .moroccan, .georgian, .sriLankan, .southern]
    
    var dietaryRestrictions = ["Vegan", "Vegetarian", "No Gluten", "Kosher", "Halal"]
    var dietaryRestrictionTypes: [CDYelpBusinessCategoryFilter] = [.vegan, .vegetarian, .glutenFree, .kosher, .halal]
    
    var specialties = ["Beer, Wine, and Spirits", "Coffee and Tea", "Cupcakes", "Custom Cakes", "Donuts", "Desserts", "Ice Cream and Frozen Yogurt", "Juice and Smoothies", "Pretzels", "Fruits And Veggies", "Herbs and Spices", "Barbeque", "Burgers", "Beverages", "Cheesesteak", "Chicken Wings", "Comfort Food", "Fast Food", "Flatbread", "Hot Dogs", "Noodles", "Pizza", "Pub Food", "Salad", "Sandwiches", "Seafood", "Soul Food", "Soup", "Steakhouses", "Waffles", "Wraps"]
    var specialtiesTypes: [CDYelpBusinessCategoryFilter] = [.beerWineAndSpirits, .coffeeAndTea, .cupcakes, .customCakes, .donuts, .desserts, .iceCreamAndFrozenYogurt, .juiceBarsAndSmoothies, .pretzels, .chocolatiersAndShops, .fruitsAndVeggies, .herbsAndSpices, .barbeque, .burgers, .beverageStore, .cheesesteaks, .chickenWings , .comfortFood, .fastFood, .flatbread, .hotDogs, .noodles, .pizza, .pubFood, .salad, .sandwiches, .seafood, .soulFood, .soup, .steakhouses, .waffles, .wraps]
    
    var diningStyles = ["Bistro", "Breakfast and Brunch", "Bakery", "Brewery", "Butcher", "Buffet", "Cafe", "Cafeteria", "Canteen", "Convenience Store", "Deli", "Diner", "Pop Up Restaurant", "Food Court", "Food Stand", "Candy Store", "Cheese Shop", "Meat Shop", "Pasta Shop", "Seafood Market", "Farmer's Market", "Fishmonger", "Food Truck", "Grocery", "Organic Store", "Health Markets", "Street Vendor", "Winery"]
    var diningStyleTypes: [CDYelpBusinessCategoryFilter] = [.bistros, .breakfastAndBrunch, .bakeries, .breweries, .butcher, .buffets, .cafes, .cafeteria, .canteen, .convenienceStores, .delis, .diners, .popUpRestaurants, .foodCourt, .foodStands, .candyStores, .cheeseShops, .meatShops, .pastaShops, .seafoodMarkets, .farmersMarket, .fishmonger, .foodTrucks, .grocery, .organicStores, .healthMarkets, .streetVendors, .wineries]
    
    var businessTypes = ["Arts and Entertainment", "Active Life", "Automotive", "Beauty and Spas", "Event Planning and Services", "Shopping", "Financial Services", "Home Services", "Health and Medical", "Nightlife", "Professional Services", "Real Estate", "Local Services"]
    var businessCategoryTypes: [CDYelpBusinessCategoryFilter] = [.artsAndEntertainment, .activeLife, .automotive, .beautyAndSpas, .eventPlanningAndServices, .shopping, .financialServices, .homeServices, .healthAndMedical, .nightlife, .professionalServices, .realEstate, .localServices]


    var body: some View {
        
NavigationView {
        VStack {
    
    Picker(selection: $storeList.FoB, label: Text("Choose food or business")) {
        ForEach(self.foodOrBusiness.indices, id: \.self){
            Text(self.foodOrBusiness[$0])
                }
        }.pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
        .padding()
        .sheet(isPresented: $showSheet) {
            StoreSheet(storeList: self.storeList)
        }
    .navigationBarTitle("Shop Black-Owned")
        .navigationBarItems(trailing:
                Button(action: {
                    self.whyAlert = true
                }) {
                    Image(systemName: "questionmark.circle")
                }
                .alert(isPresented: $whyAlert) {
                    Alert(title: Text("Why support Black-owned businesses?"), message: Text("Systemic racism has resulted in Black people often not having opportunities to build generational wealth. In supporting Black-owned businesses, you can help repair generations of economic oppression."), dismissButton: .default(Text("Got it!")))
                }
                )
    
            Form {
        
        Section(header:
        Text("Search Radius")) {
            
            VStack {
                Spacer()
                    .frame(height: 3)
                if (Int(storeList.doubleRadius/1609.34)) == 1 {
                Text("1 mile")
                   .fontWeight(.light)
                    .offset(y: 10)
                        } else if Int(storeList.doubleRadius/1609.34) == 0 {
                Text("<1 mile")
                .fontWeight(.light)
                 .offset(y: 10)
                }
                else {
                Text("\(Int(storeList.doubleRadius/1609.34)) miles")
                    .fontWeight(.light)
                    .offset(y: 10)
                        }
    HStack {
        Image(systemName: "minus").foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.bottom)
            Slider(value: $storeList.doubleRadius, in: 1609.34...40000, step: 1609.34)
                .padding(.bottom)
            .accentColor(Color(red: 145/255, green: 205/255, blue: 255/255))
        Image(systemName: "plus").foregroundColor(.gray)
        .padding(.horizontal)
        .padding(.bottom)
            }.foregroundColor(Color(red: 145/255, green: 205/255, blue: 255/255))

        }
                }
            
        
    if storeList.FoB == 0 {
        
        
        Section(header:
        Text("Sort Results")) {
        HStack {
            Button(action: {
                self.storeList.sortBy = .rating
            }) {
                if storeList.sortBy == .rating {
                    Text("Rating").bold()
                    .padding(10.0)
                        .font(.system(size: 14))
                    .foregroundColor(.white)
                                            .lineLimit(1)
                .background(RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(Color.blue))
                }
                else {
                    Text("Rating")
                        .padding(8)
                        .foregroundColor(.blue)
                                            .lineLimit(1)
                        .font(.system(size: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.blue)
                        )
            }
            }
                .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.storeList.sortBy = .bestMatch
            }) {
                if storeList.sortBy == .bestMatch {
                    Text("Best Match")
                        .fontWeight(.semibold)
                    .padding(10.0)
                    .lineLimit(1)
                        .font(.system(size: 13))
                    .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(Color.blue))
                }
                else {
                Text("Best Match")
                    .padding(8)
                    .foregroundColor(.blue)
                    .font(.system(size: 13))
                                        .lineLimit(1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
            }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.storeList.sortBy = .reviewCount
            }) {
                if storeList.sortBy == .reviewCount {
                    Text("Review Count")
                        .fontWeight(.semibold)
                    .padding(10.0)
                        .font(.system(size: 13))
                                            .lineLimit(1)
                    .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(Color.blue))
                }
                else {
                Text("Review Count")
                    .padding(8)
                    .font(.system(size: 13))
                                        .lineLimit(1)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
            }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.storeList.sortBy = .distance
            }) {
                if storeList.sortBy == .distance {
                    Text("Distance")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                                            .lineLimit(1)
                    .padding(10.0)
                    .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(Color.blue))
                }
                else {
                Text("Distance")
                    .font(.system(size: 15))
                    .padding(8)
                    .foregroundColor(.blue)
                                        .lineLimit(1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
            }
            }
            .buttonStyle(PlainButtonStyle())
        }
       .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            
            }
        
        
        Section(header:
        Text("Filter Restaurants")) {
        
        Toggle(isOn: $storeList.cuisineBool.animation()) {
             Text("Filter by Cuisine")
             .fontWeight(.light)
        }.padding(10)
            
        
        if storeList.cuisineBool == true {
        
        Picker(selection: $restaurantTypeNumber, label: Text("Choose a type of cuisine")) {
            ForEach(self.restaurantTypes.indices, id: \.self){
                Text(self.restaurantTypes[$0])
                .fontWeight(.light)
                    }
            }.pickerStyle(WheelPickerStyle())
            .labelsHidden()
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
        
        
        
        Toggle(isOn: $storeList.specialtyBool.animation()) {
             Text("Filter by Specialty")
            .fontWeight(.light)
        }.padding(10)
        
        if storeList.specialtyBool == true {
        
        Picker(selection: $specialtyNumber, label: Text("Select a specialty")) {
            ForEach(self.specialties.indices, id: \.self){
                Text(self.specialties[$0])
                .fontWeight(.light)
                    }
            }.pickerStyle(WheelPickerStyle())
            .labelsHidden()
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
        
        Toggle(isOn: $storeList.diningTypeBool.animation()) {
             Text("Filter by Style")
            .fontWeight(.light)
        }.padding(10)
        
        if storeList.diningTypeBool == true {
        
        Picker(selection: $diningTypeNumber, label: Text("Choose a dining type")) {
            ForEach(self.diningStyles.indices, id: \.self){
                Text(self.diningStyles[$0])
                .fontWeight(.light)
                    }
            }.pickerStyle(WheelPickerStyle())
            .labelsHidden()
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
            
            Group {
            
        Toggle(isOn: $storeList.priceRangeBool.animation()) {
             Text("Price Range")
            .fontWeight(.light)
        }.padding(10)
            
            if storeList.priceRangeBool == true {
            
        VStack {
                                        
                    HStack {
                        Text("$")
                        .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.top)
                        VStack {
                    HStack {
                        if Int(priceRangeDouble) == 1 {
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                        }
                        else if Int(priceRangeDouble) == 2 {
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.blue)
                                .font(.system(size: 23))
                        }
                       else if Int(priceRangeDouble) == 3 {
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                        }
                       else if Int(priceRangeDouble) == 4 {
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                            Image(systemName: "dollarsign.circle.fill")
                                 .foregroundColor(.blue)
                                 .font(.system(size: 23))
                        }
                    }.padding(.top)
                        Slider(value: $priceRangeDouble, in: 1...4, step: 1)
                            .accentColor(Color(red: 145/255, green: 205/255, blue: 255/255))
                        }
                        Text("$$$$")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top)
                            }.foregroundColor(Color(red: 145/255, green: 205/255, blue: 255/255))

                        }
            }
            }
        
        Toggle(isOn: $storeList.dietaryBool.animation()) {
             Text("Dietary Restrictions")
            .fontWeight(.light)
        }.padding(10)
        
        if storeList.dietaryBool == true {
        
        Picker(selection: $dietaryNumber, label: Text("Select any dietary restrictions")) {
            ForEach(self.dietaryRestrictions.indices, id: \.self){
                Text(self.dietaryRestrictions[$0])
                .fontWeight(.light)
                    }
            }.pickerStyle(SegmentedPickerStyle())
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .labelsHidden()
            .padding(.vertical)
            
        }
            
            Group {
                
                Toggle(isOn: $storeList.customSearchBool.animation()) {
                    Text("Custom Search")
                    .fontWeight(.light)
                    }.padding(10)
            
                if storeList.customSearchBool == true {
                        if colorScheme == .light {
                        TextField("Custom keywords", text:$storeList.customSearch)
                        .padding()
                    .background(Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1))
                            .foregroundColor(.black)
                    .cornerRadius(6)
                        } else {
                            TextField("Custom keywords", text:$storeList.customSearch)
                            .padding()
                        .background(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1))
                        .cornerRadius(6)
                        }
                }
                }
            
        }
    }
    
    
    else if storeList.FoB == 1 {
        
        Section(header:
        Text("Filter Businesses")) {
        
        Toggle(isOn: $storeList.businessBool.animation()) {
             Text("Business Type")
            .fontWeight(.light)
        }.padding()
        
        if storeList.businessBool == true {
    
    Picker(selection: $businessTypeNumber, label: Text("Choose a type of business")) {
        ForEach(self.businessTypes.indices, id: \.self){
            Text(self.businessTypes[$0])
            .fontWeight(.light)
                }
        }.pickerStyle(WheelPickerStyle())
        .labelsHidden()
        .padding()
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
        }
    }
            }
    
            Button(action: {
                self.storeList.categories = []
                self.storeList.priceTiers = []
                self.storeList.radius = Int(self.storeList.doubleRadius)
                self.storeList.searchTerms = "Black Owned"
                
                if self.storeList.FoB == 0 {
                    
                    if self.storeList.priceRangeBool == false {
                        self.storeList.priceTiers.append(.oneDollarSign)
                        self.storeList.priceTiers.append(.twoDollarSigns)
                        self.storeList.priceTiers.append(.threeDollarSigns)
                        self.storeList.priceTiers.append(.fourDollarSigns)
                    }
                    
                    if self.storeList.cuisineBool == false && self.storeList.dietaryBool == false && self.storeList.specialtyBool == false && self.storeList.diningTypeBool == false {
                    self.storeList.category1 = .restaurants
                    self.storeList.categories.append(self.storeList.category1)
                    self.storeList.categories.append(.food)
                    }
                    
                    if self.storeList.cuisineBool == true {
                self.storeList.cuisine = self.restaurantCategoryTypes[self.restaurantTypeNumber]
                self.storeList.categories.append(self.storeList.cuisine)
                    }
                    if self.storeList.dietaryBool == true {
                self.storeList.dietary = self.dietaryRestrictionTypes[self.dietaryNumber]
                        self.storeList.categories.append(self.storeList.dietary)
                    }
                    if self.storeList.specialtyBool == true {
                    self.storeList.specialty = self.specialtiesTypes[self.specialtyNumber]
                         self.storeList.categories.append(self.storeList.specialty)
                    }
                    if self.storeList.diningTypeBool == true {
                    self.storeList.diningType = self.diningStyleTypes[self.diningTypeNumber]
                         self.storeList.categories.append(self.storeList.diningType)
                    }
                    
                    if self.storeList.priceRangeBool == true {
                        if Int(self.priceRangeDouble) >= 1 {
                            self.storeList.priceTiers.append(.oneDollarSign)
                        }
                        if Int(self.priceRangeDouble) >= 2 {
                            self.storeList.priceTiers.append(.twoDollarSigns)
                        }
                        if Int(self.priceRangeDouble) >= 3 {
                            self.storeList.priceTiers.append(.threeDollarSigns)
                        }
                        if Int(self.priceRangeDouble) >= 4 {
                            self.storeList.priceTiers.append(.fourDollarSigns)
                        }
                    }
                    
                    if self.storeList.customSearchBool == true {
                        self.storeList.searchTerms = "\(self.storeList.searchTerms) \(self.storeList.customSearch)"
                    }
                    
                }
                else if self.storeList.FoB == 1 {
                    if self.storeList.businessBool == true {
                self.storeList.category1 = self.businessCategoryTypes[self.businessTypeNumber]
                    self.storeList.categories.append(self.storeList.category1)
                    } else if self.storeList.businessBool == false {
                        self.storeList.categories.append(contentsOf: self.businessCategoryTypes)
                    }
                }
                self.storeList.fetchStores()
                self.showSheet = true
            }) {
                Text("Find Stores")
                      .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.blue))
            }.padding()
        Spacer()
            .frame(height: 15)
  
    

}
}
}
}

struct FetchBusinessData_Previews: PreviewProvider {
    static var previews: some View {
        FetchBusinessData()
    }
}
