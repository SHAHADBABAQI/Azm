//
//  SwiftUIView maram.swift
//  Azm
//
//  Created by Maram Ibrahim  on 10/04/1447 AH.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        ZStack {
            //النص حق اللغة
            Image("Image 1 m")
                .ignoresSafeArea()
            Text("اختر المدة")
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(.white)
                .bold()
                .font(.title)
                .padding(.top, -300)
            
            //الزر الاول حق الشهر
            Button("شهر") {
                print("شهر")
            }
            .padding()
            .frame(width: 263)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .foregroundColor(.black)
            .padding(.top, -150)
            
            // الزر الثاني
            Button("٣ أشهر") {
                print("٣أشهر")
            }
            .padding()
            .frame(width: 263)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .foregroundColor(.black)
            .padding(.top, -60)
            
            //الزر الثالث
            Button("٦ أشهر") {
                print("٦ أشهر")
            }
            .padding()
            .frame(width: 263)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .foregroundColor(.black)
            .padding(.top, 110)
            // الشهم الاول
            Button{ } label: {
                    Image(systemName: "arrow.backward") }
            .padding()
            .background(Color(.white))
            .foregroundStyle(.black)
            .clipShape(Capsule())
            .font(.system(size: 20))
            .foregroundColor(.white)
            .offset(y: 350)
            .offset(x: -150)
            
            //السهم الثاني
            Button{ } label: {
                Image(systemName: "arrow.forward") }
            .padding()
            .background(Color(.white))
            .foregroundStyle(.black)
            .clipShape(Capsule())
            .font(.system(size: 20))
            .foregroundColor(.white)
            .offset(y: 350)
            .offset(x: 150)
            
            
            //صورة الجمل
            Image("Image 2 m")
                .padding(.leading, 307)
                .padding(.top,420)
            }
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                }


#Preview {
    ContentView2()
}

