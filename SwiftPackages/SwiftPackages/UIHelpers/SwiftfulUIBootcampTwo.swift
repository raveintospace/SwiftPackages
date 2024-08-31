//
//  SwiftfulUIBootcampTwo.swift
//  SwiftPackages
//
//  Created by Uri on 31/8/24.
//

import SwiftUI
import SwiftfulUI

struct SomeItem: Identifiable {
    let id = UUID().uuidString
    let color = Color.blue
}

struct SwiftfulUIBootcampTwo: View {
    
    @State private var items: [SomeItem] = [SomeItem(), SomeItem(), SomeItem(), SomeItem(), SomeItem()]
    
    @State private var selectedIndex: Int = 1
    @State private var dontAllow: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {
            NonLazyVGrid(columns: 3, alignment: .leading, spacing: 16, items: items) { item in
                if let item {
                    item.color
                        .frame(height: 50)
                        .frame(width: item.id == items.first?.id ? 50 : nil)
                }
            }
            
            CustomProgressBar(
                selection: 46,
                range: 0...100,
                backgroundColor: .green,
                foregroundColor: .black,
                cornerRadius: 10,
                height: 10
            )
            
            LazyZStack(allowSimultaneous: dontAllow, selection: selectedIndex, items: 0..<4) { (value: Int) in
                Rectangle()
                    .fill(
                        value == 1 ? Color.red :
                            value == 2 ? Color.blue :
                            value == 3 ? Color.green :
                            Color.yellow
                    )
                    .overlay(
                        Text("\(value)")
                    )
                    .transition(AnyTransition.scale.animation(.easeInOut))
            }
            .animation(.easeInOut, value: selectedIndex)
            .onTapGesture {
                selectedIndex += 1
            }
        }
        .padding(40)
        
        
    }
}

#Preview {
    SwiftfulUIBootcampTwo()
}

// Try LazyVGrid first
// Try Grid second
// Try NonLazyVGrid third
