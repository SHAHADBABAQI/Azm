//
//  Untitled.swift
//  Azm
//
//  Created by Maram Ibrahim on 13/04/1447 AH.
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
                    
                    // أزرار المدد بنفس تنسيق azm.swift
                    durationButton(title: "٣٠ يوم", duration: 30)
                    durationButton(title: "٦٠ يوم", duration: 60)
                    durationButton(title: "٩٠ يوم", duration: 90)
                    
                    Spacer()
                    
                    HStack {
                        // زر "عزم" (اليسار)
                        NavigationLink {
                            azm()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 50, height: 90)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            challengeDays = selectedDuration
                            navigateNext = true
                        })
                        
                        Spacer()
                        
                        // زر "التالي" (اليمين)
                        NavigationLink {
                            habitview()
                        } label: {
                            Image(systemName: "arrow.forward")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 50, height: 90)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.horizontal, 30)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 60)
                }
            }
        }
    }
    
    // دالة الزر بنفس تنسيق azm.swift
    @ViewBuilder
    private func durationButton(title: String, duration: Int) -> some View {
        Button {
            selectedDuration = duration
        } label: {
            Text(title)
                .font(.system(size: 20, design: .default))
                .foregroundColor(.black)
                .frame(width: 263, height: 44)
                .background(selectedDuration == duration ? Color.gray.opacity(0.5) : Color.button)
                .cornerRadius(14)
                .shadow(radius: 4)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView2()
}
