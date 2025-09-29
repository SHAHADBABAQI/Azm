//
//  ContentView.swift
//  Azm
//
//  Created by shahad khaled on 05/04/1447 AH.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
       HStack ( ){
            Image("Image 1")
               .resizable()
               .frame(width: 65, height: 65)
               .cornerRadius(15)
           VStack (alignment: .leading){
               Text("Riyadh")
                   .font(.title)
               Text("Capital of Saudi Arabia")
                   .foregroundColor(.gray)
              
                 

           }
           Spacer()
           Text("🇸🇦")
        }
    }
}

#Preview {
    ContentView2()
}
