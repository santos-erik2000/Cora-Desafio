//
//  CoraButton.swift
//  DesignKit
//
//  Created by Erik Santos on 13/03/24.
//

import UIKit

public typealias CoraButtonAction = (_ sender: CoraButtonView) -> Void

public class CoraButtonView: UIButton {
    
    // MARK: - Properties
    
    private(set) var action: CoraButtonAction?
    private(set) var viewModel: CoraButtonViewModelProtocol?
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        return view
    }()
    
    private(set) var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) var titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Override
    
    override public var intrinsicContentSize: CGSize {
        let superSize = super.intrinsicContentSize
        let height = getStandartHeight()
        
        guard height > .zero else { return superSize }
        return CGSize(width: superSize.width, height: height)
    }
    
    public override var isEnabled: Bool {
        didSet {
            //Mudar Cor
        }
    }
    
    public var isLoading: Bool = false {
        didSet {
            // Setar Loading
        }
    }
    
    // MARK: - Initialize
    
    private init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Static

    public static func instantiate(viewModel: CoraButtonViewModelProtocol, action: @escaping CoraButtonAction) -> CoraButtonView {
       return setup(viewModel, action: action)
    }
    
    public func setViewModel(_ viewModel: CoraButtonViewModelProtocol) {
        self.viewModel = viewModel
        buildComponent()
    }
    
    // MARK: - Private Methods
    
    private func buildComponent() {
        setupContentView()
        setupTitleLabelView()
        setupIconeView()
        setupDataView()
    }
    
    private func setupDataView() {
        guard let viewModel = viewModel else { return }
        titleLable.text = viewModel.title.text
        titleLable.font = viewModel.font
        
        iconImage.image = viewModel.icon
        
        titleLable.textColor = viewModel.title.textColor
        iconImage.tintColor = viewModel.title.textColor
        contentView.backgroundColor = viewModel.title.backgroundColor
    }
    
    private func setupTitleLabelView() {
        contentView.addSubview(titleLable)
        NSLayoutConstraint.activate([
            titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupIconeView() {
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            iconImage.heightAnchor.constraint(equalToConstant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupContentView() {
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: getStandartHeight())
        ])
    }
    
    private static func setup(_ viewModel: CoraButtonViewModelProtocol, action: @escaping CoraButtonAction) -> CoraButtonView {
        let component = CoraButtonView()
        component.action = action
        component.setViewModel(viewModel)
        return component
    }
    
    private func getStandartHeight() -> CGFloat {
        guard let viewModel = viewModel else { return .zero}
        return viewModel.size.value
    }
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let touch = touches.first, self.bounds.contains(touch.location(in: self)) && event?.type == .touches && self.isEnabled && !self.isLoading {
            
            guard let action = action else { return }
            
            self.contentView.backgroundColor = viewModel?.title.backgroundColor.withAlphaComponent(0.5)
            
            action(self)
            
            if isEnabled {
                UIView.animate(withDuration: 1.125) { [weak self] in
                    guard let self = self else { return }
                    self.contentView.backgroundColor = viewModel?.title.backgroundColor.withAlphaComponent(1)
                }
            }
        }
    }
    
}
