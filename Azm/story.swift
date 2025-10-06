import SwiftUI

struct FirstView: View {
   
    
    let desertDialogue: [String] = [
        "انا عزم صديقك الوحيد في هذي الصحراء ",
        "انا ضايع و تعبان ساعدني اطلع من هالصحراء",
        "متحمس اشوفك وعشان نتقابل يا صديقي تحتاج تنجز المهام",
        "كل مهمه تنجزها هي خطوه عشان اكون قريب لك",
        " يالله نبدا الرحله"
    ]
    
    @State private var currentTextIndex = 0
    let timer = Timer.publish(every: 7.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                
                Image("Image 12")
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .trailing, spacing: 0) {
                    ZStack {
                        Image("Image 14")
                            .padding(.bottom, 470)
                            .padding(.leading, 170)
                        
                        VStack {
                            Text(desertDialogue[currentTextIndex])
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .foregroundStyle(.black)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .padding(.horizontal, 60)
                                .padding(.top, 300)
                                .transition(.opacity)
                            
                            Spacer()
                        }
                        .padding(.top, 100)
                        .padding()
                        
                        NavigationLink {
//                            habitview()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(.te)
                                    .frame(width: 60, height: 60)
                                
                                Text("تخطي")
                                    .foregroundColor(.black)
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
}

#Preview {
     FirstView()
   
}
