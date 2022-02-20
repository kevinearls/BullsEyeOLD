//
//  RoundedViews.swift
//  BullsEye
//
//  Created by Kevin Earls on 07/02/2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String // must be the name of something from SFSymbolds
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 5.0, antialiased: true)
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .frame(width: 68.0, height: 55.78)
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String // must be the name of something from SFSymbolds
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "100")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
