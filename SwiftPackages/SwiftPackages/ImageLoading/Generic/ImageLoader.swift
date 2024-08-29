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
            )
            .clipped()
    }
}

#Preview {
    ImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fill
    )
}

// fit: image without cuts, whole image with original proportions
// fill: image may be cut, adapts to frame, loses original proportions
