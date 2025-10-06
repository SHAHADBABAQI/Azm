//
//  HabitsViewModel.swift
//  Azm
//
//  Created by rawan alkhaldi  on 14/04/1447 AH.
//

//
//  HabitsViewModel.swift
//  Azm
//
//  Created by rawan on 05/10/2025.
//

import SwiftUI

// ✅ هذا هو الملف المشترك بين الصفحتين
// يخزن كل العادات اللي المستخدم يضيفها أو يحذفها
class HabitsViewModel: ObservableObject {
    @Published var selectedHabits: [String] = []
    
    func addHabit(_ habit: String) {
        if !selectedHabits.contains(habit) {
            selectedHabits.append(habit)
        }
    }
    
    func removeHabit(_ habit: String) {
        if let index = selectedHabits.firstIndex(of: habit) {
            selectedHabits.remove(at: index)
        }
    }
}
