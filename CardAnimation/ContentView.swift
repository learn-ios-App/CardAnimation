
import SwiftUI

struct FlipCard: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                CardFrontView()
                // isFlippedがtrueの場合、透明度を0（非表示）に、falseの場合は1（表示）にする
                    .opacity(isFlipped ? 0 : 1)

                CardBackView()
                    .opacity(isFlipped ? 1 : 0)
            }
            // 3D回転アニメーションを適用。isFlippedがtrueの場合、180度回転させ、falseの場合は0度にする
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            // アニメーションの設定。値が変更されたときにアニメーションを実行
            .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: isFlipped)
            Spacer()

            Button(action: {
                isFlipped.toggle()
            }) {
                Text("Tap to flip")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct CardFrontView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white) //塗りつぶし
            .frame(width: 200, height: 300)
            //四角形の上に配置する
            .overlay(
                VStack {
                    Text("Front")
                        .font(.largeTitle)
                        //太さ指定
                        .fontWeight(.bold)
                    Text("This is the front side of the card.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            )
            .shadow(radius: 5)
    }
}

struct CardBackView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 200, height: 300)
            .overlay(
                VStack {
                    Text("Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("This is the back side of the card.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            )
            .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCard()
    }
}
