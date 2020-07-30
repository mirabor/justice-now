//
//  ImagesScroll.swift
//  Demand
//
//  Created by Mira Yu on 7/7/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import URLImage
import CDYelpFusionKit

struct ImagesScroll: View {
    
    var store: CDYelpBusiness
    
    var body: some View {
        
            
            URLImage(store.imageUrl!,
            placeholder: {
                ProgressView($0) { progress in
                    ZStack {
                        if progress > 0.0 {
                            CircleProgressView(progress).stroke(lineWidth: 8.0)
                        }
                        else {
                            CircleActivityView().stroke(lineWidth: 50.0)
                        }
                    }
                }
                    .frame(width: 50.0, height: 50.0)
            },
            content: {
                $0.image
                   .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 295, alignment: .bottom)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 10.0)
                    
                
            })
        
        }
}

