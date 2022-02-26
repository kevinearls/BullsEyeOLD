//
//  Constants.swift
//  BullsEye
//
//  Created by Kevin Earls on 20/02/2022.
//

import Foundation
import UIKit

enum Constants {
    enum General {
        public static let strokeWidth = CGFloat(2.0)
        public static let roundedViewLength = CGFloat(56.0)  // should this be width?
        public static let roundRectViewWidth = CGFloat(68.0)
        public static let roundRectViewHeight = CGFloat(56.0)
        public static let roundRectCornerRadius = CGFloat(21.0)
    }
    
    enum LeaderBoard {
        public static let scoreColumnWidth = CGFloat(50.0)
        public static let dateColumnWidth = CGFloat(170.0)
        public static let maxRowWidth = CGFloat(480.0)
    }
}
