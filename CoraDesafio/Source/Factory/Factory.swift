//
//  Factory.swift
//  CoraDesafio
//
//  Created by Erik Santos on 14/03/24.
//

import Foundation
import UIKit


// MARK: - Open Onboarding

enum OnboardingFactory {
    static func make() -> UIViewController {
        
        let coordinator: OnboardingCoordinating = OnboardingCoordinator()
        let presenter: OnboardingPreseting = OnboardingPresenter(coordinator: coordinator)
        let interactor: OnboardingInteracting = OnboardingInteractor(presenter: presenter)
        let viewController = OnboadingViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}

// MARK: - Open Login

enum LoginFactory {
    static func make(coordinator: OnboardingCoordinating) -> UIViewController {
    
        let presenter: LoginPresenting = LoginPresenter(coordinator: coordinator)
        let interactor: LoginInteracting = LoginInteractor(presenter: presenter)
        let viewController = LoginViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}

// MARK: - Open Password

enum PasswordFactory {
    static func make(coordinator: OnboardingCoordinating) -> UIViewController {
    
        let presenter: PasswordPresenting = PasswordPresenter(coordinator: coordinator)
        let interactor: PasswordInteracting = PasswordInteractor(presenter: presenter)
        let viewController = PasswordViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
