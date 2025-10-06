import SwiftUI

struct ContentView: View {
    @State private var currentDistance: Double = 65
    private let totalDistance: Double = 100
    @State private var yOffset: CGFloat = 0.0
    @State private var isBouncingUp = false

    @AppStorage("challengeDays") var challengeDays: Int = 30
    @AppStorage("completedDays") var completedDays: Int = 0
    @AppStorage("habitsCompletedToday") var habitsCompletedToday: Bool = false
    @AppStorage("lastCompletionDate") var lastCompletionDate: Double = 0 // timestamp

    @Environment(\.dismiss) var dismiss

    // ✅ Dynamic progress calculation
    private var progress: Double {
        guard challengeDays > 0 else { return 0 }
        let completed = min(max(completedDays, 0), challengeDays)
        return Double(completed) / Double(challengeDays)
    }

    var body: some View {

        ZStack {
    
            Image("Image 12")
                .ignoresSafeArea()

            VStack(spacing: 40) {
               
                Text("\(Int(completedDays)) / \(Int(challengeDays)) يوم")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)

                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 15)
                        .frame(width: 200, height: 200)

                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.yellow, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 200)
                        .animation(.easeInOut(duration: 1), value: progress)

                    GeometryReader { geo in
                        let size = geo.size.width
                        let radius = size / 2
                        let angle = progress * 360 - 90

                        let x = radius + cos(angle * .pi / 180) * radius
                        let y = radius + sin(angle * .pi / 180) * radius

                        Image("Image 16")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .position(x: x, y: y)
                            .frame(width: 100, height: 100)
                            .offset(y: yOffset)
                            .onAppear {
                                startBouncingAnimation()
                            }
                    }
                    .frame(width: 200, height: 200)
                    
                }
            }
            VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    dismiss()
                                }) {
                                    Text("إغلاق")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.black)
                                }
                                .padding(.top, 150)
                                .padding(.trailing, 30)
                            }
                            Spacer()
                        }
        }
        .onAppear {
            checkForDailyUpdate()
        }
    }

    func startBouncingAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.6)) {
                self.yOffset = self.isBouncingUp ? -6 : 0
                self.isBouncingUp.toggle()
            }
        }
    }

    func checkForDailyUpdate() {
        let now = Date().timeIntervalSince1970
        let oneDay: TimeInterval = 24 * 60 * 60

        if habitsCompletedToday && now - lastCompletionDate >= oneDay {
            completedDays += 1
            habitsCompletedToday = false
            lastCompletionDate = now
        }
    }
}

#Preview {
    ContentView()
}
