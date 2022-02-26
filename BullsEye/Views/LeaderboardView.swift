//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Kevin Earls on 25/02/2022.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            // Something?  inex
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score).frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            DateText(date: date).frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard").padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            HStack {
                Spacer()
                Button(action: {}) {
                    RoundedImageViewFilled(systemName: "xmark").padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score").frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date").frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        LeaderboardView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
