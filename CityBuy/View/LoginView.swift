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
    @EnvironmentObject var auth: Authentication
    @State private var showError = false
    @State private var loadingMsg = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Login")
                    .foregroundColor(Color("Text"))
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email address", text: $loginVM.username)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.5)))
                
                SecureField("Password", text: $loginVM.password)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.5)))
                
                HStack {
                    Spacer()
                    NavigationLink {
                        RecoveryView()
                    } label: {
                        Text("Forgot password?")
                    }
                }.frame(width: 375, height: 30)
                
                if loadingMsg {
                    ProgressView()
                        .frame(width: 375, height: 50)
                        .padding()
                } else {
                    Button("Login") {
                        loadingMsg = true
                        loginVM.login { res in
                            if res {
                                auth.updateValidation(validation: res)
                            } else {
                                showError = true
                            }
                            DispatchQueue.main.async {
                                loadingMsg = false
                            }
                        }
                    }
                    .foregroundColor(Color("Text"))
                    .frame(width: 375, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    .padding()
                }
                
                HStack {
                    Text("Dont have an account?")
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(Color("Text"))
                            .fontWeight(.medium)
                    }
                }
                
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
