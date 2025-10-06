//
//  Habits screen .swift
//  Azm
//
//  Created by sadeemalsmiry on 13/04/1447 AH.
//


import SwiftUI

struct habitview: View {
    @State private var selectedHabits: [String] = []
    let allHabits = ["شرب الماء", "الاستيقاظ مبكراً", "الرياضة لمدة نصف ساعة"];
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

                    ForEach(allHabits, id: \.self) { habit in
                        HStack {
                            Text(habit)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(12)

                            Button {
                                if !selectedHabits.contains(habit) {
                                    selectedHabits.append(habit)
                                }
                            } label: {
                                Image(systemName: "plus.circle")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                        }
                        .frame(height: 40)
                    }

                    Button {
                        showTextField = true
                    } label: {
                        HStack {
                            Text("إضافة عادة")
                            Image(systemName: "plus")
                        }
                        .padding(8)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .font(.system(size: 16, weight: .medium))
                    }

                    if showTextField {
                        HStack {
                            TextField("أكتب عادة جديدة", text: $newHabit)
                                .padding(8)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(12)
                                .font(.system(size: 16))

                            Button {
                                if !newHabit.isEmpty && !selectedHabits.contains(newHabit) {
                                    selectedHabits.append(newHabit)
                                    newHabit = ""
                                    showTextField = false
                                }
                            } label: {
                                Image(systemName: "checkmark")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.green.opacity(0.7))
                                    .cornerRadius(12)
                            }
                        }
                    }

                    Divider()
                        .padding(.vertical, 10)

                    Text("العادات المختارة..")
                        .font(.system(size: 18, weight: .medium))

                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 10) {
                            ForEach(selectedHabits, id: \.self) { habit in
                                HStack {
                                    Text(habit)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(12)

                                    Button {
                                        if let i = selectedHabits.firstIndex(of: habit) {
                                            selectedHabits.remove(at: i)
                                        }
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
    habitview()
}

