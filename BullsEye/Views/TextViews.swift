//
//  TextViews.swift
//  BullsEye
//
//  Created by Kevin Earls on 03/02/2022.
//

import SwiftUI

struct InstructionsText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .bold()
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
    
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionsText(text: "Here are your instructions")
            BigNumberText(text: "44")
            SliderLabelText(text: "100")
            LabelText(text: "Label Text")
            BodyText(text: "You scored many points\n🎉 🎉 🎉")
            ButtonText(text: "Click this button")
            ScoreText(score: 459)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
