//
//  SwiftfulRoutingMVVM.swift
//  SwiftPackages
//
//  Created by Uri on 1/9/24.
//

import SwiftUI
import SwiftfulRouting

// Routing set up in ViewModel
struct SwiftfulRoutingMVVM: View {
    var body: some View {
        RouterView { router in
            MyHomeScreenMVVM(viewModel: MyHomeScreenViewModel(router: router))
        }
    }
}

final class MyHomeScreenViewModel: ObservableObject {
    
    let router: AnyRouter
    
    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
        router.showScreen(.push) { router in
            MyThirdScreenMVVM(router: router)
        }
    }
}

struct MyHomeScreenMVVM: View {
    
    @StateObject var viewModel: MyHomeScreenViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Click me") {
                viewModel.goToNextScreen()
            }
            
            Button("Show alert") {
                viewModel.router.showAlert(.confirmationDialog, title: "Hi") {
                    Button("OK") {
                    
                    }
                    Button("OKKK") {
                        
                    }
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct MyThirdScreenMVVM: View {
        
    let router: AnyRouter
    
    var body: some View {
        Button("Click me") {
            router.dismissScreen()
        }
        .navigationTitle("Screen 3 MVVM")
    }
}

#Preview {
    SwiftfulRoutingMVVM()
}
