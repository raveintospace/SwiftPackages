//
//  SwiftfulRoutingTwo.swift
//  SwiftPackages
//
//  Created by Uri on 1/9/24.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingTwo: View {
    var body: some View {
        RouterView { router in
            MyHomeScreen(router: router)
        }
    }
}

struct MyHomeScreen: View {
    
    let router: AnyRouter
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Click me") {
                router.showScreen(.fullScreenCover, onDismiss: {
                    // do something
                }) { router in
                    MyThirdScreen(router: router)
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

struct MyThirdScreen: View {
        
    let router: AnyRouter
    
    var body: some View {
        Button("Click me") {
            router.dismissScreen()
        }
        .navigationTitle("Screen Three")
    }
}

#Preview {
    SwiftfulRoutingTwo()
}

// Pass the router directly instead of using @Environment
