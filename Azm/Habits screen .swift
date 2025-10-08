//
//  Habits screen.swift
//  Azm
//
//  Created by sadeemalsmiry on 13/04/1447 AH.
//

//
//  Habits screen.swift
//  Azm
//
//  Created by sadeemalsmiry on 13/04/1447 AH.
//

import SwiftUI

struct habitview: View {
    @StateObject var viewModel: HabitsViewModel = .init()
    
    let allHabits = ["شرب الماء", "الاستيقاظ مبكراً", "الرياضة لمدة نصف ساعة"]
    @State private var showTextField = false
    @State private var newHabit = ""
    @State private var navigateNext = false

    var body: some View {
        NavigationStack {
            ZStack {
                // الخلفية
                Image("Image 12")
                    .resizable()
                    .ignoresSafeArea()

                // المحتوى القابل للتمرير
                ScrollView {
                    VStack(spacing: 15) {
                        
                        // العنوان الرئيسي
                        Text("أضف عاداتك")
                            .font(.system(size: 32, weight: .semibold))
                            .padding(.top, 40)

                        Text("اقتراحات")
                            .font(.system(size: 18, weight: .medium))

                        // اقتراحات العادات
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

                        // زر إضافة عادة جديدة
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

                        // مربع كتابة عادة جديدة
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

                        // عرض العادات المضافة
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
                    .padding(.horizontal, 20)
                    .padding(.bottom, 140) // يترك مساحة للأزرار أسفل الصفحة
                }

                // 🔹 الأزرار أسفل الشاشة
                VStack {
                    Spacer()

                    HStack {
                        // زر "عزم"
                        NavigationLink {
                            FirstView()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 50, height: 90)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }

                        Spacer()

                        // زر "التالي"
                        NavigationLink {
                            ContentView2()
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
                    .padding(.bottom, 60)
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
        }
    }
}

#Preview {
    habitview(viewModel: HabitsViewModel())
}
