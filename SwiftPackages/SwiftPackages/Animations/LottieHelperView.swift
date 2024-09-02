//
//  LottieBootcamp.swift
//  SwiftPackages
//  https://youtu.be/u9xo-XdcRV8?si=vqjweZqj-2YkraNx
//  Created by Uri on 2/9/24.
//

import SwiftUI
import Lottie

// We call this on the rest of the app, it is a generic lottie loader
struct LottieHelperView: View {
    
    var fileName: String = "lottieStar"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure { lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
            }
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

struct LottieExampleView: View {
    
    var body: some View {
        LottieHelperView(fileName: "lottieCar", contentMode: .scaleAspectFit, playLoopMode: .loop)
    }
}

#Preview {
    VStack(spacing: 30) {
        LottieHelperView()
        LottieExampleView()
            .frame(width: 200, height: 200)
            .padding(.horizontal)
    }
}

// .json -> old format
// .dotLottie -> new format, more performant, but async loading
