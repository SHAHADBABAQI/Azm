//
//  home screen.swift
//  Azm
//
//  Created by sadeemalsmiry on 13/04/1447 AH.
//

import SwiftUI

struct HomeScreen: View {
    @State private var habits: [Habit] = [
        Habit(title: "شرب الماء"),
        Habit(title: "الاستيقاظ مبكرًا"),
        Habit(title: "الرياضة لمدة نصف ساعة"),
        Habit(title: "قراءة كتاب"),
        Habit(title: "التأمل"),
        Habit(title: "التنظيف")
    ]
    
    @State private var isTrackingAzm = false

    var body: some View {
        ZStack {
            Image("Image 12")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 25) {
                Spacer()
                
                Text("عاداتي")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach($habits) { $habit in
                            Button {
                                habit.isDone.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: habit.isDone ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(habit.isDone ? .yellow : .gray)

                                    Text(habit.title)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .strikethrough(habit.isDone, color: .yellow)
                                        .frame(width: 210, height: 45, alignment: .leading)
                                }
                                .padding(.horizontal)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 280)
                
                Spacer()
                
                Button {
                    isTrackingAzm.toggle()
                    print("تم الضغط على تتبع عزم")
                } label: {
                    HStack(spacing: 12) {
                        Text("تتبع عزم")
                            .font(.title2)
                            .foregroundColor(.black)

                        Image("Image 16")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 70)
            }
            .padding()
        }
    }
}

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    var isDone = false
}

#Preview {
    HomeScreen()
}
