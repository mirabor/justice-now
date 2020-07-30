//
//  ContactPhone.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI

struct ContactPhone: View {
    var item: ContactPerson
    
    var body: some View {
        NavigationLink(destination: ContactPhoneDetail(item: item)) {
            
        VStack(alignment: .leading) {
            Text(item.name)

            }
        }
    }
    }


