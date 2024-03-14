//
//  OnboardingCoordinator.swift
//  CoraDesafio
//
//  Created by Erik Santos on 14/03/24.
//

import Foundation
import UIKit

typealias OnboardingCoordinatorFlow = OnboardingCoordinator.CoordinatorFlow

protocol OnboardingCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    
    func perform(to flow: OnboardingCoordinatorFlow)
    func pop()
}

final class OnboardingCoordinator {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
}

// MARK: - OnboardingCoordinating

extension OnboardingCoordinator: OnboardingCoordinating {
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func perform(to flow: CoordinatorFlow) {
        switch flow {
        case .login:
            let controller = LoginFactory.make(coordinator: self)
            viewController?.navigationController?.pushViewController(controller, animated: true)
        case .register:
            print("Registro")
        case .password:
            let controller = PasswordFactory.make(coordinator: self)
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

// MARK: - CoordinatorFlow

extension OnboardingCoordinator {
    enum CoordinatorFlow {
        case login
        case register
        case password
    }

}
