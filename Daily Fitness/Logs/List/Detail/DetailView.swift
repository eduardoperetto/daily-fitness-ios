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

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: meal.imageName)
        return UIImageView(image: image)
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
//        addSubview(imageView)

        backgroundColor = .white

        configureConstraints()
    }

    private func configureConstraints() {
        let margin: CGFloat = 20

        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),

            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),

            // Image
//            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
//            imageView.widthAnchor.constraint(equalToConstant: 100),
//            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
