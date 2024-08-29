//
//  KingfisherExample.swift
//  SwiftPackages
//  https://youtu.be/S9eQd76oFHk?si=HrqS8iUA0jio9n5s
//  Created by Uri on 29/8/24.
//

import SwiftUI
import Kingfisher

struct KingfisherImageLoader: View {
    
    let url: String
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Color.red
            }
            .resizable()
            .onProgress({ receivedSize, totalSize in
                
            })
            .onSuccess({ result in
                
            })
            .onFailure({ error in
                
            })
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    KingfisherImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fill
    )
    .frame(width: 200, height: 200)
}

// fit: image without cuts, whole image with original proportions
// fill: image may be cut, adapts to frame, loses original proportions
