
//  ContentView.swift
//  3zm
//
//  Created by rawan alkhaldi  on 03/04/1447 AH.
//

import SwiftUI

struct azm: View {
    var body: some View {
        
        NavigationStack{
            
            VStack {
                ZStack{
                    Image("BG")
                        .resizable()
                    
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    
                    VStack{
                        VStack{
                            Spacer()
//                            Spacer().frame(height: 90)
                            
                            Text("خطتي")
                                .font(.system(size: 35, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .offset(y: 50)
                             
                            
                          Spacer().frame(height: 100)
                            Text("شرب الماء")
                                .font(.system(size: 20, design: .default))
                                .foregroundColor(.black)
                                .frame(width: 263, height: 44)
                                .background(Color.button)
                                .opacity(80)
                                .cornerRadius(14)
                               
                                .shadow(radius: 4)
                                
                            
                         Spacer().frame(height: 20)
                            
                            
                            // الزر الثاني
                            Text("الاستيقاظ مبكرا")

                                .font(.system(size: 20, design: .default))
                                .foregroundColor(.black)
                                .frame(width: 263, height: 44)
                                .background(Color.button)
                                .cornerRadius(14)
                                .opacity(80)
                                .shadow(radius: 4)

                          Spacer().frame(height: 20)
                            
                            
                            // الزر الثالث
                            Text("الرياضة لمدة نصف ساعة")

                                .font(.system(size: 20, design: .default))
                                .foregroundColor(.black)
                                .frame(width: 263, height: 44)
                                .background(Color.button)
                                .cornerRadius(14)
                                .shadow(radius: 4)
//                              .opacity(80)
                          // Spacer()
                            
                        }
                        
                        //الزر الرابع
                        HStack() {
                         
                     Spacer()
                            
                            
                                Text("٦٠ يوم")
                                // .font(.system(size: 24))
                                .font(.system(size: 20, design: .default))
                                    .foregroundColor(.black)
                                    .opacity(180)
                                    
                                  
                              
                                Image(systemName: "calendar")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                                   
                          
                            }
                        .offset(y: 50)
                       .padding(.trailing, 20)
                     //  .padding(.bottom, 350)
                           

                   
                        HStack (spacing: 230){
                            
                            
                            NavigationLink {
                                ContentView2()
                            }
                            
                            label:{
                                
                                
                                
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50) // حجم الزر
                                                .background(Color.white)      // الخلفية البيضاء
                                                .clipShape(Circle())          // يجعلها دائرية
                                                .shadow(radius: 4)
                                
                                
                                
                            }
                            
                            
                            
                            NavigationLink {
                                ContentView2()
                            }
                            
                            label:{
                                
                                
                                
                                Image(systemName: "arrow.forward")
                                    .font(.system(size: 20))
                                    
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50) // حجم الزر
                                                .background(Color.white)      // الخلفية البيضاء
                                                .clipShape(Circle())          // يجعلها دائرية
                                                .shadow(radius: 4)
                                
                            }
                        }
                       
                        .padding(.horizontal, 30)   // مسافة عن الحواف الجانبية
                        .frame(maxHeight: .infinity, alignment: .bottom) // تثبيتهم تحت
                        .padding(.bottom, 60)
                    }
                    
                }
            }
            
           
            
        }
    }
        }

     
               
           

#Preview {
    azm()
}

