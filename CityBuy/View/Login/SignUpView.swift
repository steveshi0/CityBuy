//
//  SignUpView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showError = false
    @ObservedObject var loginVM = LoginViewModel()
    @EnvironmentObject var auth: Authentification

    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button("Sign up") {
                    loginVM.signUp(email: username, password: password) { res in
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
                Spacer()
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Sign Up Error"),
                      message: Text("Please try again later"),
                      dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}
