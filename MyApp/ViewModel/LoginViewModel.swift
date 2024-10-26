//
//  LoginViewModel.swift
//  MyApp
//
//  Created by Vijay Guruju on 24/06/24.
//

import Foundation

struct User {
    let userName:String
    let passowrd:String
}

class LoginViewModel:ObservableObject {
    @Published var username:String
    @Published var password:String
    var currentUser:User?
    @Published var isValid = false
    
    init(username:String = "", password:String = "") {
        self.username = username
        self.password = password
        self.currentUser = User(userName: username, passowrd: password)
    }
    
    func validateUser() -> Bool {
        fetchUserData()
        return isValid
    }
    
    func fetchUserData() {
        if let path = Bundle.main.path(forResource: "User", ofType: "plist") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
                    if let dict = plistData as? [String: Any] {
                        if let username = dict["username"] as? String , let password = dict["password"] as? String  {
                            print("Username is \(username.lowercased())")
                            print("Password is \(password)")
                            self.isValid = isUsernameValid(username: username) && isPasswordValid(password: password)
                        }
                    }
                } catch {
                    print("Error reading Plist: \(error)")
                }
            }
        }
    }
    
    func isUsernameValid(username:String) -> Bool {
        return self.username.lowercased() == username
    }
    
    func isPasswordValid(password:String) -> Bool {
        return self.password == password
    }
    
}
