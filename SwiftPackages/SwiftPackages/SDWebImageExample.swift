//
//  SDWebImageExample.swift
//  SwiftPackages
//
//  Created by Uri on 27/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

// We call this on the rest of the app
// We can manage several SDKs with this struct (if SDWeb... else Kingfisher)
struct ImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                SDWebImageLoader(url: url, contentMode: contentMode)
            )
            .clipped()
    }
}

// Only available in this file
fileprivate struct SDWebImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url))
            .onSuccess(perform: { image, data, cacheType in
                //
            })
            .onFailure(perform: { error in
                //
            })
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: contentMode)
    }
}

struct SDWebImageExample: View {
    
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            contentMode: .fill
        )
        .frame(width: 100, height: 300)
        
//        .onAppear {
//            ImagePrefetcher.instance.startPrefetching(urls: <#T##[URL]#>)
//        }
        
    }
}

#Preview {
    SDWebImageExample()
}

extension SDWebImageExample {
    
    private var testCurrentCode: some View {
        WebImage(url: URL(string: "https://picsum.photos/id/237/200/300")) { image in
            image.resizable()
        }
    placeholder: {
        Color.gray.opacity(0.3)
            .overlay(
                ProgressView()
            )
    }
    .aspectRatio(contentMode: .fit)
    }
}

// logic to preload data that will be shown to user
final class ImagePrefetcher {
    
    static let instance = ImagePrefetcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

 
// Using rectangle + overlay + clipped so frame works fine
// contentMode .fill extends out of the frame -> check with clipped
