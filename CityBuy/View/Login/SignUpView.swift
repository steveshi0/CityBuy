//
//  SignUpView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var useremail = ""
    @State private var password = ""
    @State private var showError = false
    @State private var loadingMsg = false
    @ObservedObject var loginVM = LoginViewModel()
    @EnvironmentObject var auth: Authentification
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Sign Up")
                    .foregroundColor(Color("Text"))
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("First Name", text: $firstname)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.75)))
                
                TextField("Last Name", text: $lastname)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.75)))
                
                TextField("Email address", text: $useremail)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.75)))
                
                SecureField("Password", text: $password)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.75)))
                
                if loadingMsg {
                    ProgressView()
                        .frame(width: 375, height: 50)
                        .padding()
                } else {
                    Button("Sign Up") {
                        loadingMsg = true
                        loginVM.signUp(email: useremail, password: password) { res in
                            if res {
                                auth.updateValidation(validation: true)
                            } else {
                                showError = true
                            }
                            DispatchQueue.main.async {
                                loadingMsg = false
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 375, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
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
