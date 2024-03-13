//
//  TesteView.swift
//  CoraDesafio
//
//  Created by Erik Santos on 13/03/24.
//

import UIKit
import DesignKit

class TesteView: UIView {


    private lazy var buttonCora: CoraButtonView = {
        let viewModel = CoraButtonViewModel(
            title: CoraAccessibleText(text: "Quero fazer parte!", textColor: CoraAssets.defaultPinkColor.color, backgroundColor: .white),
            icon: .systemImage(CoraStrings.Icons.arrowRight),
            font: .font(16),
            size: .tall
        )
        
        let view = CoraButtonView.instantiate(viewModel: viewModel) { sender in
            print("Teste")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonCora)
        
        NSLayoutConstraint.activate([
            buttonCora.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonCora.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonCora.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
