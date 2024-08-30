//
//  KeychainSwiftExample.swift
//  SwiftPackages
//  https://youtu.be/NCREPNvFpjk?si=nTuttLOD1X71Ofd7
//  Created by Uri on 30/8/24.
//

import SwiftUI
import KeychainSwift

// Manages all Keychain operations
final class KeychainManager {
    
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, forKey: String) {
        keychain.set(value, forKey: forKey)
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
    
    func delete(key: String) {
        keychain.delete(key)
    }
}

// Define the default value for the custom environment key
struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

// To access KeychainManager from any view
extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

struct KeychainSwiftExample: View {
    
    @Environment(\.keychain) var myKeychain
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Button(userPassword.isEmpty ? "No password" : userPassword) {
                let newPassword = "Defqon25"
                myKeychain.set(newPassword, forKey: "user_password")
            }
            .onAppear {
                userPassword = myKeychain.get(key: "user_password") ?? ""
        }
            
            Button("Delete password") {
                myKeychain.delete(key: "user_password")
                userPassword = myKeychain.get(key: "user_password") ?? ""
            }
        }
    }
}

#Preview {
    KeychainSwiftExample()
}

// Similar to UserDefaults or AppStorage, persist data from users on the device
// Keychain is encrypted: passwords, personal data
// Keychain persists between installs and across devices
