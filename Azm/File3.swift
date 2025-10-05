import SwiftUI

struct IntroView: View {
    let namespace: Namespace.ID
    // ✅ المتغير المفقود الذي يحل خطأ استدعاء IntroView
    @Binding var stage: Int

    var body: some View {
        ZStack {
            // الخلفية
            Image("Image 13")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // النص الذي سيتحرك (موقع البداية)
            (    Text("اهلين أنا عزم …")
                    .fontWeight(.black)
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .matchedGeometryEffect(id: "MovingText", in: namespace)
                    .padding(.bottom,390.0)
                    .padding(.leading, 30.0)
                    .foregroundStyle(.orange) // ⚠️ لونك الخاص (.te)
                )
                // الصورة السفلية
                Image("Image 15")
                    .padding(.leading, 90.0)
                    .padding(.top ,-380)
                    .frame(width: nil)
                
                Spacer()
            }
        }
        // الانتقال التلقائي: يبدأ بعد 3 ثوانٍ
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    stage = 1
                }
            }
        }
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
    // يجب تمرير قيمة ثابتة لـ stage في Preview
    return IntroView(namespace: previewNamespace, stage: .constant(0))
}
