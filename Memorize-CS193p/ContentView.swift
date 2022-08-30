//
//  ContentView.swift
//  Memorize
//
//  Created by Yağız Doğukan Yılmaz on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔", "🌎", "🌍", "🌏", "🪐", "☀️", "✨", "☄️", "💫","🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚠", "🚂", "🛩", "🚁", "🚤","⌚️", "📱", "💻", "🖥", "🖨", "🕹", "💾", "💿", "📷", "☎️", "📺", "🎙", "⏰", "⏳", "🔋", "🪫", "💳", "🪚", "🔭", "🔬"]
    @State var emojiStart = 0
    @State var emojiEnd = 16
    
    var body: some View {
        
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[emojiStart..<emojiEnd], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.purple)
            Spacer()
//            HStack{
//                removeButton
//                Spacer()
//                addButton
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
            HStack{
                spaceTheme
                Spacer()
                vehicleTheme
                Spacer()
                objectTheme
            }
            .foregroundColor(.blue)
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
//    var removeButton: some View{
//        Button{
//                if (emojiCounter > 1){
//                    emojiCounter -= 1
//                }
//            } label: {
//                Image(systemName: "minus.rectangle.portrait")
//            }
//    }
//
//    var addButton: some View{
//        Button(
//            action: {
//                if (emojiCounter < spaceEmojis.count){
//                    emojiCounter += 1
//                }
//            },
//            label: {
//                Image(systemName: "plus.rectangle.portrait")
//            }
//        )
//    }
    
    var spaceTheme: some View{
        Button(
            action: {
                emojiStart = 0
                emojiEnd = Int.random(in: 4...16)
                emojis[emojiStart..<emojiEnd].shuffle()
            },
            label: {
                VStack{
                    Image(systemName: "globe.americas.fill")
                    Text("Space")
                        .font(.caption)
                }
            }
        )
    }
    
    var vehicleTheme: some View{
        Button(
            action: {
                emojiStart = 16
                emojiEnd = Int.random(in: 20...40)
                emojis[emojiStart..<emojiEnd].shuffle()
            },
            label: {
                VStack{
                    Image(systemName: "car")
                    Text("Vehicles")
                        .font(.caption)
                }
            }
        )
    }
    
    var objectTheme: some View{
        Button(
            action: {
                emojiStart = 40
                emojiEnd = Int.random(in: 44...60)
                emojis[emojiStart..<emojiEnd].shuffle()
            },
            label: {
                VStack{
                    Image(systemName: "desktopcomputer")
                    Text("Objects")
                        .font(.caption)
                }
            }
        )
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View {
        ZStack{
            let card = RoundedRectangle(cornerRadius: 10.0)
            if (isFaceUp){
                card.fill().foregroundColor(.white)
                card.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                card.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}
