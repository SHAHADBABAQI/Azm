//
//  ContentView.swift
//  Azm
//
//  Created by shahad khaled on 05/04/1447 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Image 4")
                .ignoresSafeArea()
            Text("اضف عاداتك...")
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(.white)
                .bold()
                .font(.title)
                .padding(.top, -300)
            VStack(spacing: 30){
                HStack{
                    Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    
                }
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
