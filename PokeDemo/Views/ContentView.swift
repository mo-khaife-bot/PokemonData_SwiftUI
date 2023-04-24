//
//  ContentView.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import SwiftUI

struct ContentView: View {

    @State var emailID: String = ""
    @State var passwordId: String = ""
    
    let loginViewModel = LoginViewModel()
    
    
    
    @State var path = [Root]()
    
    var body: some View {
        
        NavigationStack(path: $path){
            VStack {
                
                Group{
                    Image("pika")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
    //                    .padding(.top, 200)
                    
                    
                    TextField("Enter Email Login", text: $emailID).textFieldStyle(.roundedBorder).frame(width: 275).padding(.top, 20)
                    
                    SecureField("Enter Password", text: $passwordId).textFieldStyle(.roundedBorder).frame(width: 275).padding(.top, 10)
                    
                    Button("Login"){
                        
                        if loginViewModel.doValidLogin(emailID: emailID, passwordId: passwordId){
                            print("user \(emailID) logged in!")
                            print("user \(passwordId) logged in!")
                            
                            path.append(.details)
                            
                        }else {
                            print("Invalid Login")
                        }
                    }.frame(width: 90, height: 40).font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue)).buttonStyle(PlainButtonStyle())
                        .padding(.top, 20)
                
                
                }
                NavigationLink{
                    EmptyView()
                }label: {
                    Text("Go List Screen")
                }
                NavigationLink{
                    PokemonGrid()
                }label: {
                    Text("Go Pokemon Grid Screen")
                }
                
//                NavigationLink{
//                    CustomTabBarView()
//                }label: {
//                    Text("Tabs Screen")
//                }
                
            
                
                Spacer()
            }
            // trail end of VStack
            .padding()
            
            .navigationDestination(for: Root.self){ navigate in
                switch navigate {
                case .list:
                    EmptyView()
                case .details:
                    DetailsScreen(email: emailID, password: passwordId)
                case .grid:
                    PokemonGrid()
                default:
                    EmptyView()
                }
                
            }
            // fits within vStack just benfore NavigationStack
//            .navigationTitle(Text("Login Screen"))
//            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        // trail end of NavigationStack
        
    }
        enum Root{
            case list
            case details
            case grid
            
        }

        

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
