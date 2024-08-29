//
//  ImageLoader.swift
//  SwiftPackages
//
//  Created by Uri on 29/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

// We call this on the rest of the app, it is a generic image loader
// We can manage several SDKs with this struct (if SDWeb... else Kingfisher)
struct ImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                //SDWebImageLoader(url: url, contentMode: contentMode)
                KingfisherImageLoader(url: url, contentMode: contentMode)
                    .allowsHitTesting(false)
            )
            .clipped()
    }
}

#Preview {
    ImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fit
    )
}

// fit: image without cuts, whole image with original proportions
// fill: image may be cut, adapts to frame, loses original proportions

// Rectangle controls the frame and image adapts to it with the overlay
// If we don't use rectangle, with the same frame (200*200), image occupies more space than rectangle, because it is higher (200*300)
// Clipped puts the image inside the rectangle
// .allowsHitTesting(false) - only rectangle frame is clickable
