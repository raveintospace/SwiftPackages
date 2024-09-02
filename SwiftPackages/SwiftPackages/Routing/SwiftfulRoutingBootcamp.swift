//
//  SwiftfulRoutingBootcamp.swift
//  SwiftPackages
//  https://youtu.be/zKfhv-Yds4g?si=48FM8eUegu884jaG
//  Created by Uri on 1/9/24.
//

import SwiftUI
import SwiftfulRouting

// Router with @Environment
struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { _ in
            MyHomeView()
        }
    }
}

struct MyHomeView: View {
    @Environment(\.router) var router
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Click me") {
                router.showScreen(.fullScreenCover, onDismiss: {
                    // do something
                }) { _ in
                    MyThirdView()
                }
            }
            
            Button("Show alert") {
                router.showAlert(.alert, title: "Hi") {
                    Button("OK") {
                        
                    }
                }
            }
            
            Button("Show modal") {
                router.showBasicModal {
                    Text("This is a modal")
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct MyThirdView: View {
    @Environment(\.router) var router
    
    var body: some View {
        Button("Click me") {
            router.dismissScreen()
        }
        .navigationTitle("Screen 3")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}

// RouterView works under a NavigationStack
// https://github.com/SwiftfulThinking/SwiftfulRoutingExample -> Project to test all functionalities
