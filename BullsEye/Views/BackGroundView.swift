//
//  BackGroundView.swift
//  BullsEye
//
//  Created by Kevin Earls on 07/02/2022.
//

import SwiftUI

struct BackGroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            // This can also be done just by adding onTapGesture to RoundedRectangle
            Button(action: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
    
}

struct RingsView: View {
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .frame(width: size, height: size)
                    
            }
            //}
        }
    }
}

struct BackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundView(game: .constant(Game()))
        //BottomView(game: .constant(Game()))
    }
}
