import SwiftUI

struct ContentView1: View {
    @Namespace private var namespace
    @State private var stage: Int = 0 // 0: Intro, 1: FirstView
    
    var body: some View {
        ZStack {
            if stage == 0 {
                // نمرر stage لإعطائه القدرة على التحديث
                IntroView(namespace: namespace, stage: $stage)
            } else {
                FirstView(namespace: namespace)
            }
        }
        .animation(.easeInOut(duration: 0.8), value: stage)
        
        // نعتمد على المؤقت في IntroView للحظة الظهور
        // (تم حذف onAppear من هنا)
    }
}
#Preview {}
