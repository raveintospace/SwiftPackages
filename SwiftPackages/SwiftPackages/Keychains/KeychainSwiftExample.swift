//
//  KeychainSwiftExample.swift
//  SwiftPackages
//  https://youtu.be/NCREPNvFpjk?si=nTuttLOD1X71Ofd7
//  Created by Uri on 30/8/24.
//

// Similar to UserDefaults or AppStorage, persist data from users on the device
// Keychain is encrypted: passwords, personal data
// Keychain persists between installs and across devices

import SwiftUI
import KeychainSwift

// MARK: - KeyChainManager
// Manages all Keychain operations
// Useful to work with Keychain off the view layer
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

struct KeychainManagerEasy: View {
    
    let keychainManager = KeychainManager()
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("KeychainManager")
                .bold()
            
            Button(userPassword.isEmpty ? "No password" : userPassword) {
                let newPassword = "Defqon24"
                keychainManager.set(newPassword, forKey: "user_password")
            }
            .onAppear {
                userPassword = keychainManager.get(key: "user_password") ?? ""
        }
            
            Button("Delete password") {
                keychainManager.delete(key: "user_password")
                userPassword = keychainManager.get(key: "user_password") ?? ""
            }
        }
    }
}


// MARK: - EnvironmentKey
// Define the default value for the custom environment key
// Useful to work with Keychain on the view layer
struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

// Access KeychainManager from any view
extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

struct KeychainSwiftExampleEnvironment: View {
    
    @Environment(\.keychain) var myKeychain
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("EnvironmentKey")
                .bold()
            
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

// MARK: - Keychain property wrapper
// Alternative to environment key
// Useful to work with Keychain on the view layer
@propertyWrapper
struct KeychainStorage: DynamicProperty {
    @State private var newValue: String
    let key: String
    let keychain: KeychainManager
    
    var wrappedValue: String {
        get {
            newValue
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
        })
    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        let keychain = KeychainManager()
        
        self.keychain = keychain
        newValue = keychain.get(key: key) ?? ""
        debugPrint("Success read")
    }
    
    func save(newValue: String) {
        keychain.set(newValue, forKey: key)
        self.newValue = newValue
        print("Success saved")
    }
}

struct KeychainSwiftExamplePropertyWrapper: View {
    @KeychainStorage("user_password") var userPassword: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Property Wrapper")
                .bold()
            
            Button(userPassword.isEmpty ? "No password" : userPassword) {
                let newPassword = "Defqon26"
                userPassword = newPassword
            }
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        KeychainManagerEasy()
        Divider()
            .frame(minHeight: 5)
            .overlay(.red)
        KeychainSwiftExampleEnvironment()
        Divider()
            .frame(minHeight: 5)
            .overlay(.red)
        KeychainSwiftExamplePropertyWrapper()
    }
}
