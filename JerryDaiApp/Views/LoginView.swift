//
//  ContentView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-11-29.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .frame(width: 400, height: 600, alignment: .center)
            
            Image ("icon")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .padding(.bottom, 400)
        
            
            VStack{
            TextField(" Username", text: self.$email)
                .frame(width: 250, height: 40, alignment: .center)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .cornerRadius(6)
                           .padding([.leading, .trailing], 24)
                           .keyboardType(.default)
            
            SecureField(" Password", text: self.$password)
                .frame(width: 250, height: 40, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(6)
                            .padding([.leading, .trailing], 24)
                            .keyboardType(.default)
                
                Button("Login") {
                     print("Button was pressed")
                }
                
                .frame(width: 250, height: 40, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(6)
                .padding(.top,30)

                HStack {
                    Text ("Forget your password?")
                        .font(.system(size: 15))
                        .padding(.top,30)
                        .foregroundColor(Color.white)
                    
                    Button("Sign up") {
                         print("Button was pressed")
                    }
                    
                    .frame(width:65, height: 25, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
                    .padding(.top,30)
                    .font(.system(size: 15))
                }
                
                
    
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
