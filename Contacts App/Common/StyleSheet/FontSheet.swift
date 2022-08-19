//
//  FontSheet.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import Foundation
import UIKit
import SwiftUI

public enum CommonFont {

    enum PoppinsFontStyle: FontStyle {
        case light
        case bold
        case regular
        case medium
        case semiBold

        var name: String {
            switch self {

            case .light: return "Poppins-Light"
            case .regular: return "Poppins-Regular"
            case .bold: return "Poppins-Bold"
            case .medium: return "Poppins-Medium"
            case .semiBold: return "Poppins-SemiBold"
            }
        }
    }
    enum MontserratFontStyle: FontStyle{
        case light
        case bold
        case regular
        case medium
        case semiBold
        case extraBold
        
        var name: String{
            switch self{
                
            case .light: return "Montserrat-Light"
            case .regular: return "Montserrat-Regular"
            case .bold: return "Montserrat-Bold"
            case .medium: return "Montserrat-Medium"
            case .semiBold: return "Montserrat-SemiBold"
            case .extraBold: return "Montserrat-ExtraBold"
            }
        }
    }
}

protocol FontStyle {
    var name: String { get }
}

// MARK: - UIFont extension
extension UIFont {

    convenience init(commonFont: FontStyle, size: CGFloat) {
        self.init(name: commonFont.name, size: size)!
    }
}
