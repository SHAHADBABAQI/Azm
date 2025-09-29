//
//  ContentView.swift
//  Azm
//
//  Created by shahad khaled on 05/04/1447 AH.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        VStack(spacing: 20){
            
            Image("Image 6")
                .resizable()
                .clipShape(Circle())
                .frame(width: 400, height: 300)
                .overlay {
                               Circle().stroke(.yellow, lineWidth: 4)
                           }
                           .shadow(radius: 7)
                           .padding(.top, -100)
                           
            VStack(alignment: .leading, spacing: 20){
                Text("Shahad Khaled Babaqi")
                    .bold()
                    .foregroundColor(.orange)
                    .font(.system(size: 25, weight: .bold, design: .default))
                
                Text("i love tennis.")
                
            }
                

            
            
            
        }
    }
}

#Preview {
    ContentView3()
}
