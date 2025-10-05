import SwiftUI

struct FirstView: View {
    let namespace: Namespace.ID
    
    let desertDialogue: [String] = [
        "انا عزم صديقك الوحيد في هذي الصحراء ",
        "انا ضايع و تعبان من الحر والعطش احتاج تساعدني اطلع من هالصحراء",
        "متحمس اشوفك وعشان نتقابل يا صديقي تحتاج تنجز المهام",
        "وكل مهمه تنجزها هي خطوه عشان اكون قريب لك",
        "مبسوط انك معي يالله نبدا الرحله"
    ]
    
    @State private var currentTextIndex = 0
    // تم تصحيح خطأ الترميز هنا (الفاصلة)
    let timer = Timer.publish(every: 7.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            // الخلفية: تم تصحيحها لملء الشاشة بالكامل
            Image("Image 13")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .trailing, spacing: 0) {
                
                // ⬅️ النص المتحرك: (يستقر في هذا الموضع كعنوان)
                // هذا هو الاستقبال الوحيد للنص، مما يحل مشكلة التكرار
              //  Text("اهلين أنا عزم …")
              //      .matchedGeometryEffect(id: "MovingText", in: namespace)
             //       .fontWeight(.bold)
              //      .font(.title)
           //         .foregroundColor(.black)
           //         .padding(.top, 50)
           //         .padding(.trailing, 20)
            //
                // باقي المحتوى الرئيسي
                ZStack {
                    Image("Image 14")
                        .padding(.bottom, 470)
                        .padding(.leading, 170)

                    VStack {
                        // النص الخاص بالحوار المتغير
                        Text(desertDialogue[currentTextIndex])
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .foregroundStyle(.black)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding(.horizontal, 60)
                            .padding(.top, 300) // تعديل البادينغ ليتناسب مع العنوان الجديد
                            .transition(.opacity)
                        
                        Spacer()
                    }
                    .padding(.top, 100)

                    Button {
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.yellow) // ⚠️ استخدم لونك (.cer)
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.black) // ⚠️ استخدم لونك (.greesh)
                                .font(.system(size: 20))
                        }
                    }
                    .offset(x: -150, y: 350)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                currentTextIndex = (currentTextIndex + 1) % desertDialogue.count
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
    return FirstView(namespace: previewNamespace)
}
