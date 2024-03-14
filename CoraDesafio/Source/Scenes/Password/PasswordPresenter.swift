//
//  PasswordPresenter.swift
//  CoraDesafio
//
//  Created by Erik Santos on 14/03/24.
//

import Foundation

protocol PasswordPresenting: AnyObject {
    var viewController: PasswordDisplaying? { get set }
    
    func didPop()
    func setEnableButton(_ value: Bool)
}

final class PasswordPresenter {
    
    // MARK: - Properties
    
    weak var viewController: PasswordDisplaying?
    private let coordinator: OnboardingCoordinating
    
    // MARK: - Initialize
    
    init(coordinator: OnboardingCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - PasswordPresenting

extension PasswordPresenter: PasswordPresenting {
    func setEnableButton(_ value: Bool) {
        viewController?.setEnableButton(value)
    }
    
    func didPop() {
        coordinator.pop()
    }
}
