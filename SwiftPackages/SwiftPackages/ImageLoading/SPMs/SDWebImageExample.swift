//
//  SDWebImageExample.swift
//  SwiftPackages
//  https://youtu.be/3QZTGatsI-c?si=Ec3hQumxJ_HDQzWH
//  Created by Uri on 27/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

// Specific code for SDWebImage
struct SDWebImageLoader: View {
    
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

#Preview {
    VStack(spacing: 100) {
        SDWebImageLoader(
            url: "https://picsum.photos/id/23/200/300",
            contentMode: .fill
        )
        .frame(width: 200, height: 200)
        
        //SDWebImageExample()
    }
}

struct SDWebImageExample: View {
    
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/23/200/300",
            contentMode: .fill
        )
        .frame(width: 100, height: 300)
        
//        .onAppear {
//            ImagePrefetcher.instance.startPrefetching(urls: <#T##[URL]#>)
//        }
        
    }
}

extension SDWebImageExample {
    
    private var testCurrentCode: some View {
        WebImage(url: URL(string: "https://picsum.photos/id/23/200/300")) { image in
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
