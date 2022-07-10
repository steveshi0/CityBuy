//
//  Login.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var LoginVM = LoginViewModel()
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $LoginVM.username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $LoginVM.password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button("Login") {
                    LoginVM.login { res in
                        if !res {
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
                Alert(title: Text("Login Error"),
                      message: Text("Please double check the username/password"),
                      dismissButton: .default(Text("Ok"))
                )
            }
            
        }
    }
}
