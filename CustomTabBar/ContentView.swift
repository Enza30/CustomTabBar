//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Farendza Muda on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var shouldShowModel = false
    
    let tabBarImageNames = ["person","gear","plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModel, content: {
                        Button(action: {shouldShowModel.toggle()}, label: {
                            Text("Fullscreen cover")
                        })
                        
                    })
                
                switch selectedIndex {
                case 0:
                    NavigationView{
                        ScrollView{
                            ForEach(0..<50) { num in
                                Text("\(num)")
                                
                            }
                        }
                            .navigationTitle("First Tab")
                    }
                    
                case 1:
                    ScrollView{
                        Text("Test")
                    }
                    
                default:
                    NavigationView{
                        Text("Remaining tabs")
                    }
                   
                }
                
                
            }
            
//            Spacer()
            
            Divider()
                .padding(.bottom, 8)
            
            HStack{
                ForEach(0..<5) { num in
                    Button(action: {
                        
                        if num == 2 {
                            shouldShowModel.toggle()
                            return
                        }
                        
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        
                        
                        Spacer()
                    })

                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
