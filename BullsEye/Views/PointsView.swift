//
//  PointsView.swift
//  BullsEye
//
//  Created by Kevin Earls on 15/02/2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionsText(text: "The slider's value is")
            
            BigNumberText(text: "\(roundedValue)")
            BodyText(text: "You scored \(points) points")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(minWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(color: Color.pink, radius: 10, x: 5, y: 5)
            .transition(.scale)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        //PointsView().preferredColorScheme(.dark)
        //PointsView().previewLayout(.fixed(width: 568, height: 320))
    }
}
