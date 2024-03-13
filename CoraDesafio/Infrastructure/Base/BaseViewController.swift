//
//  BaseViewController.swift
//  CoraDesafio
//
//  Created by Erik Santos on 13/03/24.
//

import Foundation
import UIKit
import DesignKit




open class BaseViewController<V: UIView>: UIViewController, BaseViewControllerProtocol {
    
     open var navigationCora: StickNavigationView = {
        let viewModel = StickNavigationViewModel(
            title: StickNavigationTitle(font: .font(14), color: CoraAssets.darkGray.color),
            leftButton: StickNavigationLeftButton(image: .systemImage(CoraStrings.Icons.chevronLeft), color: CoraAssets.defaultPinkColor.color),
            backgroundColor: CoraAssets.lightGray.color
        )
    
        let view = StickNavigationView.instantiate(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var rootView = V()
    
    open override func loadView() {
        view = rootView
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.addSubview(navigationCora)
    
        NSLayoutConstraint.activate([
            
            navigationCora.topAnchor.constraint(equalTo: rootView.topAnchor),
            navigationCora.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            navigationCora.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
        ])
    }
}
