//
//  LoginView.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @ObservedObject var showingView: ShowingView
    
    @SwiftUI.State private var showingAlert = false
    @SwiftUI.State private var isValidated = false
    @SwiftUI.State private var errorMessage: String = ""
    
    var body: some View {
        GeometryReader { geo in
            List {
                VStack() {
                    Text("Welcome!")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .padding([.top, .bottom], 50)
                        .shadow(radius: 6.0, x: 10, y: 10)
                    
                   TextField("Username", text:$viewModel.username)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(25.0)
                            .shadow(radius: 10.0, x: 5, y: 10)
                            .padding([.leading, .trailing], 50)
                            .toolbar {
                                ToolbarItem(placement: .keyboard) {
                                    Button("Done") {
                                        // Dismiss the keyboard
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }
                            }
                        SecureField("Password", text: $viewModel.password)
                            .textContentType(.password)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(25.0)
                            .shadow(radius: 10.0, x: 5, y: 10)
                            .padding([.leading, .trailing], 50)
                    
                    Button(action: {} ) {
                        Text("Forgot password?")
                            .padding([.leading], 150)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        if self.viewModel.username.contains("@")  {
                            if self.viewModel.username.isValidEmail() == true {
                                isValidated = true
                            }else {
                                isValidated = false
                            }
                            
                        }else {
                            isValidated = true
                        }
                        
                        if isValidated == true {
                            Task {
                                let loginResponse =  await viewModel.login()
                                if loginResponse.0 == true {
                                    self.showingView.viewId = AppViews.HomeView
                                }else{
                                    self.showingView.viewId = AppViews.LoginView
                                    errorMessage = "Login Failed.The user credentials were incorrect."
                                    showingAlert = true
                                }
                                
                            }
                            
                        }else{
                            errorMessage = "Email is Invalid."
                            showingAlert = true
                        }
                        
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(.gray)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding(.top, 50)
                        .disabled((viewModel.username.isEmpty || viewModel.password.isEmpty))
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("BVD Group"), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
                            
                        }
                    HStack {
                        Text("Don't have an account? ")
                            .foregroundColor(.black)
                        Button(action: {}) {
                            Text("Sign Up")
                                .underline()
                                .foregroundColor(.black)
                        }
                    }.padding()
                    
                }.frame(width: geo.size.width, height: geo.size.height, alignment:.center)
            }.listRowSeparator(.hidden)
        }
        
    }
}

#Preview {
    LoginView( showingView: ShowingView(showingView: AppViews.HomeView))
}
