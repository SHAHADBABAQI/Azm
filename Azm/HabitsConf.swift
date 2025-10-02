//
//  ContentView.swift
//  3zm
//
//  Created by rawan alkhaldi  on 03/04/1447 AH.
//

import SwiftUI

struct azm: View {
    var body: some View {
        ZStack{
            Image("BackGround")
                .resizable()
            
                .scaledToFill()
                .ignoresSafeArea()
            
            
            
            Text("شرب الماء")
                           //.font(.system(size: 24))
                           .font(.custom("Sf Arabic Display", size: 24))
                           .foregroundColor(.font)
                           .frame(width: 263, height: 44)
                           .background(Color.button)
                           .cornerRadius(14)
                           .opacity(80)
                           .offset(y:  -230)

            
            // الزر الثاني
                       Text("الاستيقاظ مبكرا")
                         //  .font(.system(size: 24))
                .font(.custom("Sf Arabic Display", size: 24))
            
                           .foregroundColor(.font)
                           .frame(width: 263, height: 44)
                           .background(Color.button)
                           .cornerRadius(14)
                           .opacity(80)
                           .offset(y:  -170)

                       // الزر الثالث
                       Text("الرياضة لمدة نصف ساعة")
                           //.font(.system(size: 24))
                .font(.custom("Sf Arabic Display", size: 24))
                           .foregroundColor(.font)
                           .frame(width: 263, height: 44)
                           .background(Color.button)
                           .cornerRadius(14)
                           .opacity(80)
                           .offset(y:  -110)
            
            
            
         

          
                
          Rectangle()
                
             .frame(width: 44, height: 44)
            
                .cornerRadius(20)
                
                  .foregroundColor(Color.button)
                
                .offset(y:  350)
                .offset(x: -150)
            
            Button(action: {}){
                
                Image(systemName: "arrow.backward")
                    .font(.system(size: 20))
                    .foregroundColor(.arrow)
                    .offset(y:  350)
                    .offset(x: -150)
               
        
          }
            
            Rectangle()
                  
               .frame(width: 44, height: 44)
              
                  .cornerRadius(20)
                  
                    .foregroundColor(Color.button)
                  
                  .offset(y:  350)
                  .offset(x: 150)
              
              Button(action: {}){
                  
                  Image(systemName: "arrow.forward")
                      .font(.system(size: 20))
                      .foregroundColor(.arrow)
                      .offset(y:  350)
                      .offset(x: 150)
                 
          
            }
            
            Image(systemName: "calendar")
                .font(.system(size: 24))
                .foregroundColor(.calendar)
                .offset(x: 170)
                .offset(y: 30)
                
                
            
//الزر الرابع
            HStack {
                
           
            Text("ثلاثة اشهر")
               // .font(.system(size: 24))
                .font(.custom("Sf Arabic Display", size: 24))
                .foregroundColor(.font)
                .frame(width: 101, height: 44)
                .background(Color.button)
                .cornerRadius(14)
                .opacity(180)
                .offset(y:  30)
                .offset(x: 96)
            
            Image(systemName: "calendar.fill")
                .foregroundColor(.white)
                .font(.system(size: 40))
                .offset(y: 150)
                
                }

            }
            
           
                
            }

            
                   }
               
           

#Preview {
    azm()
}


