import SwiftUI

struct ContentView: View {
    @State private var currentDistance: Double = 65
    private let totalDistance: Double = 100
    
    @State private var progress: Double = 0.7 // 👈 demo progress
    @State private var yOffset: CGFloat = 0.0
    @State private var isBouncingUp = false
    
    var body: some View {
        ZStack {
            // Background
            Image("Image 7")
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Title text
                Text("\(Int(currentDistance)) / \(Int(totalDistance)) يوم")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                
                // Circular progress with camel
                ZStack {
                    // Background circle
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 15)
                        .frame(width: 200, height: 200)
                    
                    // Progress circle
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 200)
                        .animation(.easeInOut(duration: 1), value: progress)
                    
                    // Camel face at tip
                    GeometryReader { geo in
                        let size = geo.size.width
                        let radius = size / 2
                        let angle = progress * 360 - 90
                        
                        let x = radius + cos(angle * .pi / 180) * radius
                        let y = radius + sin(angle * .pi / 180) * radius
                        
                        Image("Image 16")
                            .resizable()
//                            .background(
//                                            Circle()
//                                                .fill(Color.white) // Fill the background circle with a color
//                                        )
                                          
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
        }
    }
    
    func startBouncingAnimation() {
        // Much smaller bounce
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.6)) {
                self.yOffset = self.isBouncingUp ? -6 : 0 // 👈 only 6px bounce
                self.isBouncingUp.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}

