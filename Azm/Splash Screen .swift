//
//  Splash Screen .swift
//  Azm
//
//  Created by Maram Ibrahim  on 13/04/1447 AH.
//

import SwiftUI

struct SplashView: View {
    @State private var circleScale: CGFloat = 0.1
    @State private var moveUpRight = false
    @State private var showText = false
    @State private var showMountain = false
    @State private var showStory = false // ✅ بعد انتهاء السبلاش نعرض القصة
    
    var body: some View {
        ZStack {
            if showStory {
                // صفحة القصة تظهر مباشرة بعد انتهاء السبلاش
                FirstView()
            } else {
                // شاشة السبلاش
                Color.white.ignoresSafeArea()
                
                Image("Image 10") // الخلفية
                
                if showMountain {
                    Image("Image 15")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 758)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 2.0), value: showMountain)
                }
                
                VStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.98, green: 0.82, blue: 0.44))
                            .scaleEffect(circleScale)
                            .frame(width: 200, height: 200)
                            .offset(
                                x: moveUpRight ? 100 : 0,
                                y: moveUpRight ? -150 : 0
                            )
                        
                        VStack {
                            Image("Image 16")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                            
                            if showText {
                                Text("عزم")
                                    .font(.system(size: 36, weight: .bold))
                                    .foregroundColor(.black)
                                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                            }
                        }
                        .offset(
                            x: moveUpRight ? 100 : 0,
                            y: moveUpRight ? -150 : 0
                        )
                    }
                    Spacer()
                }
                .onAppear {
                    animateSplash()
                }
            }
        }
    }
    
    func animateSplash() {
        // تكبير أولي للدائرة
        withAnimation(.easeInOut(duration: 1.2)) {
            circleScale = 6.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            // تصغير الدائرة قليلاً قبل ظهور النص
            withAnimation(.easeInOut(duration: 1.0)) {
                circleScale = 1.3
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                // ظهور النص
                withAnimation(.easeIn(duration: 0.8)) {
                    showText = true
                }
            }
            
            // المرحلة الأخيرة: الدائرة والجمل تتحرك للأعلى وتتصغر + ظهور الجبل
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeInOut(duration: 1.2)) {
                    moveUpRight = true
                    circleScale = 0.1
                    showMountain = true
                }
                
                // بعد انتهاء الأنميشن، عرض القصة مباشرة
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    withAnimation(.easeInOut) {
                        showStory = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
