//
//  SuccessView.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 22/02/23.
//

import UIKit

final class SuccessView: UIView {
    // MARK: - Properties

    private let openHome: () -> Void
    @objc private func _openHome() { openHome() }

    // MARK: - Inner Views

    private let iconView: UIImageView = {
        let image = UIImage(systemName: "checkmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Meal saved succesfully"
        label.font = .systemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let returnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Return home", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    init(openHome: @escaping () -> Void) {
        self.openHome = openHome
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        backgroundColor = .white

        addSubview(iconView)
        addSubview(successLabel)
        addSubview(returnButton)
        returnButton.addTarget(self, action: #selector(_openHome), for: .touchDown)

        configureConstraints()
    }

    private func configureConstraints() {
        let screenWidth: CGFloat = 320
        let buttonHeight: CGFloat = 70

        NSLayoutConstraint.activate([
            // Title label
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: topAnchor, constant: 300),
            iconView.widthAnchor.constraint(equalToConstant: 100),
            iconView.heightAnchor.constraint(equalToConstant: 100),

            // Logs button
            successLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            successLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 100),
            successLabel.widthAnchor.constraint(equalToConstant: screenWidth),
            successLabel.heightAnchor.constraint(equalToConstant: buttonHeight),

            // Register button
            returnButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            returnButton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            returnButton.widthAnchor.constraint(equalToConstant: screenWidth),
            returnButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}
