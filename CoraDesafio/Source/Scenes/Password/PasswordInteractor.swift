//
//  PasswordInteractor.swift
//  CoraDesafio
//
//  Created by Erik Santos on 14/03/24.
//

import Foundation
import CoreKit

protocol PasswordInteracting: AnyObject {
    func didPop()
    func validatePassword(_ value: String)
    func savePasswordOnMemory(_ value: String)
}

final class PasswordInteractor {
    
    // MARK: - Properties
    
    private let presenter: PasswordPresenting
    
    // MARK: - Initialize
    
    init(presenter: PasswordPresenting) {
        self.presenter = presenter
    }
}

// MARK: - PasswordInteracting

extension PasswordInteractor: PasswordInteracting {
    func savePasswordOnMemory(_ value: String) {
        LoginBuilderHelper.shared.save(.password(value))
        // Fetch
    }
    
    func validatePassword(_ value: String) {
        let isPassword = InputValidationHelper.shared.validatePassword(value)
        presenter.setEnableButton(isPassword)
    }
    
    func didPop() {
        presenter.didPop()
    }
}
