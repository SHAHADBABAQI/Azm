//
//  Habits screen.swift
//  Azm
//
//  Created by sadeemalsmiry on 13/04/1447 AH.
//

import SwiftUI

struct habitview: View {
    // ✅ استبدلنا @State بـ @ObservedObject
    @StateObject var viewModel: HabitsViewModel = .init()
    
    let allHabits = ["شرب الماء", "الاستيقاظ مبكراً", "الرياضة لمدة نصف ساعة"]
    @State private var showTextField = false
    @State private var newHabit = ""

    var body: some View {
        ZStack {
            Image("Image 12")
                .resizable()
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 15) {
                    Text("أضف عاداتك")
                        .font(.system(size: 32, weight: .semibold))
                        .padding(.top, 40)

                    Text("اقتراحات")
                        .font(.system(size: 18, weight: .medium))

                    // ✅ إضافة من الاقتراحات
                    ForEach(allHabits, id: \.self) { habit in
                        HStack {
                            Text(habit)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(12)

                            Button {
                                viewModel.addHabit(habit)
                            } label: {
                                Image(systemName: "plus.circle")
                                    .font(.title2)
                                    .foregroundColor(.add)
                            }
                        }
                        .frame(height: 40)
                    }

                    // ✅ زر إضافة عادة جديدة
                    Button {
                        showTextField = true
                    } label: {
                        HStack {
                            Text("إضافة عادة")
                            Image(systemName: "plus")
                        }
                        .padding(8)
                        .background(Color.add.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .font(.system(size: 16, weight: .medium))
                    }

                    // ✅ مربع كتابة عادة جديدة
                    if showTextField {
                        HStack {
                            TextField("أكتب عادة جديدة", text: $newHabit)
                                .padding(8)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(12)
                                .font(.system(size: 16))

                            Button {
                                if !newHabit.isEmpty {
                                    viewModel.addHabit(newHabit)
                                    newHabit = ""
                                    showTextField = false
                                }
                            } label: {
                                Image(systemName: "checkmark")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.check.opacity(0.7))
                                    .cornerRadius(12)
                            }
                        }
                    }

                    Divider()
                        .padding(.vertical, 10)

                    Text("العادات المختارة..")
                        .font(.system(size: 18, weight: .medium))

                    // ✅ عرض العادات المضافة
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 10) {
                            ForEach(viewModel.selectedHabits, id: \.self) { habit in
                                HStack {
                                    Text(habit)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(12)

                                    Button {
                                        viewModel.removeHabit(habit)
                                    } label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .padding(4)
                                            .background(Color.white.opacity(0.6))
                                            .cornerRadius(8)
                                    }
                                }
                                .frame(height: 50)
                            }
                        }
                    }
                    .frame(maxHeight: 300)

                    Spacer(minLength: 30)
                }
                .padding(.horizontal, 20)
                .environment(\.layoutDirection, .rightToLeft)
            }
        }
    }
}

#Preview {
    habitview(viewModel: HabitsViewModel())
}
