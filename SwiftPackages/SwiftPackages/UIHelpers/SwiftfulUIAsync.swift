//
//  SwiftfulUIBootcampAsync.swift
//  SwiftPackages
//
//  Created by Uri on 1/9/24.
//

import SwiftUI
import SwiftfulUI

struct SwiftfulUIAsync: View {
    
    private func getSomeData() async throws -> String {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return "Some String"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncButton {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
            } label: { isPerformingAction in
                ZStack {
                    if isPerformingAction {
                        ProgressView()
                    }
                    
                    Text("Hello, world!")
                        .opacity(isPerformingAction ? 0 : 1)
                }
            }
            
            AsyncViewBuilder {
                try await getSomeData()
            } content: { phase in
                switch phase {
                case .loading:
                    ProgressView()
                case .success(let newData):
                    Text(newData)
                case .failure:
                    Text("Error")
                }
            }
        }
    }
}

#Preview {
    SwiftfulUIAsync()
}
