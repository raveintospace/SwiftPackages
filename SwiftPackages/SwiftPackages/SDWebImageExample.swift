//
//  SDWebImageExample.swift
//  SwiftPackages
//
//  Created by Uri on 27/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageExample: View {
    
    var body: some View {
        testNick
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
    
    private var testNick: some View {
        WebImage(url: URL(string: "https://picsum.photos/id/237/200/300"))
            .onSuccess(perform: { image, data, cacheType in
                //
            })
            .onFailure(perform: { error in
                //
            })
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: .fit)
    }
}
