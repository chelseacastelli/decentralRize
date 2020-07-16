//
//  ContentView.swift
//  decentralRize
//
//  Created by ChelseaAnne Castelli on 7/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    
        ContentView()
        
    }
}

struct Home : View {
    

    @State var topIndex = 0
    
    var body: some View {
        
        ZStack{
            
            Color.black.opacity(0.97)
                .edgesIgnoringSafeArea(.all)
            
        
            VStack{
                
                
                HStack{
                    
                    Image("logo")
                        .renderingMode(.original)
                    
                    
//                    Spacer()
                                        
                }
                .padding()
                
                HStack{
                    
                    HStack(spacing: 30){
                        
                        ForEach(0..<topMenu.count){menu in
                            
                            TopMenu(menu: menu, index: self.$topIndex)
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.top)
                
                Spacer(minLength: 0)
            }
                
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        
            
            HStack{
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        if self.topIndex == 0{
                            
                            About()
                        }
                        else if self.topIndex == 1{
                            Wellness()
                        }
                        else if self.topIndex == 2{
                            Businesses()
                        }
                        else if self.topIndex == 3{
                            Contact()
                        }
                        else {
                            
                        }
                        
                    }
                    
                }
            }
            
        }
    }
}


struct TopMenu : View {
    
    var menu : Int
    @Binding var index : Int
    
    var body: some View {
        
        VStack(spacing: 8){
            
            Text(topMenu[menu])
                .font(.subheadline)
                .fontWeight(.light)
                .fontWeight(self.index == menu ? .bold : .none)
                .foregroundColor(self.index == menu ? .white : .gray)
            
            Circle()
                .fill(Color.white)
                .frame(width: 5, height: 5)
                .opacity(self.index == menu ? 1: 0)
            
        }
        
        .onTapGesture {
            
            withAnimation{
                
                self.index = self.menu
                
            }
            
            
            
        }
        
       
        
    }
    
}


var topMenu = ["About", "Wellness", "Businesses", "Contact"]


struct About : View {
    
    var body: some View{
        
        VStack{
            
            
           
//            ScrollView(.vertical, showsIndicators: true){
                
                Text("Intro").font(.title)
                .foregroundColor(.white)
                .offset(y: 100)
                
                VStack{
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. Velit euismod in pellentesque massa placerat duis. Sit amet venenatis urna cursus eget nunc. Vitae tortor condimentum lacinia quis vel eros donec ac odio. Arcu odio ut sem nulla pharetra diam. Morbi quis commodo odio aenean. Ultrices sagittis orci a scelerisque purus. \nNibh cras pulvinar mattis nunc sed blandit. Pulvinar sapien et ligula ullamcorper malesuada proin libero nunc.Pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus. Integer eget aliquet nibh praesent. Commodo quis imperdiet massa tincidunt nunc pulvinar. Neque laoreet suspendisse interdum. Consectetur libero id faucibus nisl tincidunt. Senectus et netus et malesuada fames ac turpis. Cursus metus aliquam eleifend mi in nulla posuere sollicitudin. Non odio euismod lacinia at quis risus sed vulputate. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. Magna sit amet purus gravida quis blandit turpis cursus in. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et.")
                    .foregroundColor(.white)
                    .offset(y: 100)
                }.padding(.horizontal)
            }
            
//        }
        

    }
}
    


struct Wellness : View {
    
    var body: some View{
        
        VStack{
            
            Text("Wellness")
                .font(.largeTitle)
                .foregroundColor(.white)
                
            
            
            
            
        }
        
    }
    
}

struct Businesses : View {
    
    var body: some View{
        
        VStack{
            
            Text("Businesses")
                .font(.largeTitle)
                .foregroundColor(.white)
            
        }
        
    }
    
}

struct Contact : View {
    
    @State var name: String = ""
    @State var username: String = ""
    @State var message: String = ""
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("Contact")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(.white)
            
            TextField("Name", text: $name)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.9))
                .cornerRadius(7)
            
            TextField("Email", text: $name)
            .padding(.all)
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.9))
            .cornerRadius(7)
            
            TextField("Message", text: $name)
            .padding(.all)
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.9))
            .cornerRadius(7)

            
            RoundedButton()
            
        }
        .padding(.horizontal, 15)
        
       
        
    }
}

struct RoundedButton : View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Send Message")
                    .font(.headline)
                    .foregroundColor(.white)
                    .cornerRadius(2.5)
               
                Spacer()
                
            }
        }
        .padding(.vertical, 10.0)
//        .background(Color.white)
        .padding(.horizontal, 50)
        .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white, lineWidth: 2)
        )
    }
}
