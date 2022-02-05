//
//  BullsEyeView.swift
//  BullsEye
//
//  Created by Kevin Earls on 20/01/2022.
//

import SwiftUI

struct BullsEyeView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            InstructionsView(game: $game)
                .padding(.leading)
                .padding(.trailing)
            SliderView(sliderValue: $sliderValue)
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(
                "Hello there!",
                isPresented: $alertIsVisible,
                presenting: {
                  let roundedValue = Int(sliderValue.rounded())
                  return (
                    roundedValue,
                    game.points(sliderValue: roundedValue)
                  )
                } () as (roundedValue: Int, points: Int)
              ) { data in
                Button("Awesome!") {
                  game.startNewRound(points: data.points)
                }
              } message: { data in
                  Text("The slider's value is \(data.roundedValue).\n" + "You scored \(data.points) points this round.")
                  Text("This is the message part")
              }
             
        }
    }
    
    struct InstructionsView: View {
        @Binding var game: Game
        
        var body: some View {
            VStack {
                InstructionsText(text: "🎯 🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                BigNumberText(text: String(game.target))
            }
        }
    }
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: self.$sliderValue, in:1.0...100.0)
                SliderLabelText(text: "100")
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BullsEyeView()
        BullsEyeView().previewLayout(.fixed(width: 568, height: 320))
    }
}
