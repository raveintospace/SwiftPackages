//
//  SwiftfulStrechy.swift
//  SwiftPackages
//
//  Created by Uri on 1/9/24.
//

import SwiftUI
import SwiftfulUI

struct SwiftfulStretchy: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.green)
                        .overlay(
                            ZStack {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: "https://picsum.photos/800/800"))
                                }
                            }
    //                        Image(systemName: "heart.fill")
    //                            .resizable()
    //                            .scaledToFill()
    //                            .padding(100)
                        )
                        .asStretchyHeader(startingHeight: 250)
                }
            }
        }

    }
}

#Preview {
    SwiftfulStretchy()
}
