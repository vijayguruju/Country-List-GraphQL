//
//  LogInView.swift
//  MyApp
//
//  Created by Vijay Guruju on 31/05/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State var selected = false
    @State var hasError = false
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.mint.ignoresSafeArea()
                    VStack {
                        UserNameTextField()
                        PasswordTextField()
                        LoginButton()                    }
                }
                .navigationTitle("Welcome")
                .navigationDestination(isPresented:$selected, destination: { CountryListView()})
            }
            .onAppear(perform: {
                //print("its here")
        
            })
            .alert("Error", isPresented: $hasError, actions: {
                
            }, message: {
                Text("Invalid Credentials")
            })
    }
    
    func UserNameTextField() -> some View {
        TextField("Username", text: $viewModel.username)
            .padding()
            .frame(width: 350,height: 50)
            .font(.system(size: 20))
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 25))
            .padding(5)
            
    }
    func PasswordTextField() -> some View {
        TextField("Password", text: $viewModel.password)
            .padding()
            .frame(width: 350,height: 50)
            .font(.system(size: 20))
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 25))
            .padding(5)
    }
    
    func LoginButton() -> some View {
        Button("Login", action: {
            selected = viewModel.validateUser()
            hasError = !selected
        })
        .frame(width: 350,height: 50)
        .background(Color.black)
        .foregroundStyle(Color.white)
        .clipShape(.rect(cornerRadius: 25))
        .bold()
        .padding()
        .font(.title3)
    }
    
}


#Preview {
    LoginView(selected: false)
}

