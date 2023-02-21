//
//  MealCell.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

class MealCell: UITableViewCell {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let rightImageView = UIImageView()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration

    private func configureSubviews() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)

        rightImageView.contentMode = .scaleAspectFit
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightImageView)
    }

    private func configureConstraints() {
        let margins = contentView.layoutMarginsGuide

        // Title Label Constraints
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true

        // Description Label Constraints
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

        // Right Image View Constraints
        rightImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rightImageView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        rightImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }

    // MARK: - Setters

    func setTitle(_ title: String?) {
        titleLabel.text = title
    }

    func setDescription(_ description: String?) {
        descriptionLabel.text = description
    }

    func setImage(_ image: UIImage?) {
        rightImageView.image = image
    }
}
