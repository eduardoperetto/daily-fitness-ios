//
//  DetailView.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 22/02/23.
//

import UIKit

final class DetailView: UIView {
    // MARK: - Properties

    private let meal: Meal

    // MARK: - Inner views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = meal.title
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = meal.description
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView: UIImageView = {
        let image = UIImage(systemName: "photo.fill")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Init

    init(meal: Meal) {
        self.meal = meal
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageView)

        backgroundColor = .white

        configureConstraints()
    }

    private func configureConstraints() {
        let margin: CGFloat = 20
        let imageSize: CGFloat = 320

        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),

            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),

            // Image view
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            imageView.heightAnchor.constraint(equalToConstant: imageSize*1.5),
        ])
    }
}
