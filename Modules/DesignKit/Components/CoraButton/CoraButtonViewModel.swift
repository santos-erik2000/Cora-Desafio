//
//  CoraButtonViewModel.swift
//  DesignKit
//
//  Created by Erik Santos on 13/03/24.
//

import Foundation
import UIKit

public typealias CoraButtonSize = CoraButtonViewModel.ButtonSize
public typealias CoraAccessibleText = CoraButtonViewModel.AccessibleText

public protocol CoraButtonViewModelProtocol {
    var title: CoraAccessibleText { get }
    var icon: UIImage? { get }
    var font: UIFont? { get }
    var size: CoraButtonSize { get }
    
    init(title: CoraAccessibleText, icon: UIImage?, font: UIFont?, size: CoraButtonSize)
}

public class CoraButtonViewModel: CoraButtonViewModelProtocol {
    public let title: CoraAccessibleText
    public let icon: UIImage?
    public let font: UIFont?
    public let size: CoraButtonSize
    
    required public init(title: CoraAccessibleText, icon: UIImage?, font: UIFont?, size: CoraButtonSize) {
        self.title = title
        self.icon = icon
        self.font = font
        self.size = size
    }
}

extension CoraButtonViewModel {
    public struct AccessibleText {
        let text: String
        let textColor: UIColor
        let backgroundColor: UIColor
        
        public init(text: String, textColor: UIColor, backgroundColor: UIColor) {
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
        }
    }
}

extension CoraButtonViewModel {
    public enum ButtonSize {
        case tall
        case small
        
        var value: CGFloat {
            switch self {
            case .tall:
                return 80.0
            case .small:
                return 64.0
            }
        }
    }
    
}
