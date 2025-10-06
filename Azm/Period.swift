//
//  Untitled.swift
//  Azm
//
//  Created by Maram Ibrahim  on 13/04/1447 AH.
//

import SwiftUI

struct ContentView2: View {
    @AppStorage("challengeDays") var challengeDays: Int = 30
    @State private var selectedDuration: Int = 30 // default
    @State private var navigateNext = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Image 17")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer().frame(height: 170)
                    
                    Text("اختر المدة")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer().frame(height: 30)
                    
                    durationButton(title: "٣٠ يوم", duration: 30)
                        .padding(.top, 50)
                    durationButton(title: "٦٠ يوم", duration: 60)
                        .padding(.top, 10)
                    durationButton(title: "٩٠ يوم", duration: 90)
                        .padding(.top, 9)
                    
                    Spacer()
                    
                    HStack {
                        // زر "عزم" (اليسار) ✅ يحفظ الأيام ثم ينتقل
                        NavigationLink {
                            azm()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                                .font(.system(size: 20))
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            challengeDays = selectedDuration
                            navigateNext = true
                        })
                        
                        Spacer()
                        
                        // زر "التالي" (اليمين) للتنقل فقط
                        NavigationLink {
                            habitview()
                        } label: {
                            Image(systemName: "arrow.forward")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                                .font(.system(size: 20))
                                .frame(height: 170)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder
    private func durationButton(title: String, duration: Int) -> some View {
        Button {
            selectedDuration = duration
        } label: {
            Text(title)
                .frame(width: 263)
                .padding()
                .background(selectedDuration == duration ? Color.gray : Color(.systemGray6))
                .cornerRadius(12)
                .foregroundColor(.black)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView2()
}
