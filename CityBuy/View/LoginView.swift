//
//  Login.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    @EnvironmentObject var auth: Authentification
    @State private var showError = false
    @State private var showRecoverySheet = false
    @State private var showSignUpSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $loginVM.username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $loginVM.password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                HStack {
                    Spacer()
                    NavigationLink("Forgot password") {
                        RecoveryView()
                    }
                }.frame(width: 300, height: 30)
                
                Button("Login") {
                    loginVM.login { res in
                        auth.updateValidation(validation: true)
                        if res {
                            auth.updateValidation(validation: res)
                        } else {
                            showError = true
                        }
                    }
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                labelledDivider(label: "New user?", horizontalPadding: 50)
                
                NavigationLink("Sign Up") {
                    SignUpView()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.purple)
                .cornerRadius(10)
                .padding()
                
                Spacer()
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Login Error"),
                      message: Text("Please double check the username/password"),
                      dismissButton: .default(Text("Ok"))
                )
            }
            
        }
    }
}

// An divider with text in the middle   -----??-----
struct labelledDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    
    init(label: String, horizontalPadding: CGFloat = 10) {
        self.label = label
        self.horizontalPadding = horizontalPadding
    }
    var body: some View {
        HStack {
            line
                .padding(EdgeInsets(top: 0, leading: horizontalPadding, bottom: 0, trailing: 0))
            Text(label)
                .foregroundColor(.black)
            line
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: horizontalPadding))
        }
    }
    var line: some View {
        VStack {
            Divider().background(.black)
        }
    }
}
