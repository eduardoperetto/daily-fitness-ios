//
//  HomeView.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

final class HomeView: UIView {
    // MARK: - Properties

    private let didTapLogs: () -> Void
    private let didTapRegisterMeal: () -> Void

    // MARK: - Inner views

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily Fitness"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()

    private let logsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("Logs", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let registerMealButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("Register meal", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    init(
        didTapLogs: @escaping () -> Void,
        didTapRegisterMeal: @escaping () -> Void
    ) {
        self.didTapLogs = didTapLogs
        self.didTapRegisterMeal = didTapRegisterMeal
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

        addSubview(titleLabel)

        logsButton.addTarget(self, action: #selector(onLogsButtonTap), for: .touchDown)
        addSubview(logsButton)

        registerMealButton.addTarget(self, action: #selector(onRegisterMealButtonTap), for: .touchDown)
        addSubview(registerMealButton)

        configureConstraints()
    }

    private func configureConstraints() {
        let screenWidth: CGFloat = 260
        let buttonHeight: CGFloat = 75

        NSLayoutConstraint.activate([
            // Title label
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: topAnchor, constant: screenWidth),

            // Logs button
            logsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            logsButton.widthAnchor.constraint(equalToConstant: screenWidth),
            logsButton.heightAnchor.constraint(equalToConstant: buttonHeight),

            // Register button
            registerMealButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerMealButton.centerYAnchor.constraint(equalTo: logsButton.centerYAnchor, constant: 100),
            registerMealButton.widthAnchor.constraint(equalToConstant: screenWidth),
            registerMealButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }

    @objc private func onLogsButtonTap() {
        didTapLogs()
    }

    @objc private func onRegisterMealButtonTap() {
        didTapRegisterMeal()
    }
}
