//
//  SwiftfulUIBootcamp.swift
//  SwiftPackages
//
//  Created by Uri on 31/8/24.
//

import SwiftUI
import SwiftfulUI

struct SwiftfulUIBootcamp: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .withBackgroundAndBorder(
                    backgroundColor: .blue,
                    borderColor: .red,
                    borderWidth: 2,
                    cornerRadius: 32
                )
                .padding()
            
            Text("Gradient animated")
                .padding()
                .withGradientBackgroundAnimatable(isActive: isActive, activeGradient: LinearGradient(colors: [Color.red, .blue], startPoint: .leading, endPoint: .trailing), defaultGradient: LinearGradient(colors: [Color.green, .orange], startPoint: .leading, endPoint: .trailing), cornerRadius: 10)
                .onTapGesture {
                    withAnimation {
                        isActive.toggle()
                    }
                }
            
            Text("As button")
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .withBackgroundAndBorder(
                    backgroundColor: .red,
                    borderColor: .blue,
                    borderWidth: 2,
                    cornerRadius: 32
                )
                .asButton(scale: 0.7, opacity: 1, brightness: 0) {
                    isActive.toggle()
                }
                .padding()
            
            Text("With drag gesture")
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .withBackgroundAndBorder(
                    backgroundColor: .yellow,
                    borderColor: .green,
                    borderWidth: 2,
                    cornerRadius: 32
                )
                .frame(width: 200)
                .padding()
                .withDragGesture(
                    [.horizontal, .vertical],
                    minimumDistance: 0,
                    resets: true,
                    rotationMultiplier: 1.1,
                    onChanged: { dragOffset in
                        // what happens when object is dragged
                    },
                    onEnded: { dragOffset in
                        // what happens when dragging finishes
                    }
                )
        }
    }
}

#Preview {
    SwiftfulUIBootcamp()
}
