//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Kevin Earls on 25/02/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                
                ScrollView {
                    VStack {
                        ForEach(game.leaderboard.indices) { i in
                            let entry = game.leaderboard[i]
                            RowView(index: i, score: entry.points, date: entry.date)
                        }
                    }
                }
             
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
    @Binding var leaderBoardIsShowing: Bool

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
                Button(action: {
                    leaderBoardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark").padding(.trailing)
                }
            }
            .padding(.top)
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
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
