//
//  ViewController.swift
//  CoraDesafio
//
//  Created by Erik Santos on 13/03/24.
//

import UIKit
import DesignKit

final class ViewController: BaseViewController<TesteView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CoraAssets.defaultPinkColor.color
        navigationCora.delegate = self
        navigationCora.setViewModel(setDefaultNavigation(title: "OLAA"))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension ViewController: StickNavigationViewDelegate {
    func didTapLeftButton() {
        print("BACK")
    }
}
