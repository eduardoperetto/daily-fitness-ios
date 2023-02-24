//
//  SaveFormsView.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

final class SaveFormsView: UIView {
    // MARK: - Properties

    private let didTapSave: () -> Void
    @objc private func _didTapSave() { didTapSave() }

    // MARK: - Inner Views

    private let imageView: UIImageView = {
        let image = UIImage(systemName: "photo.fill")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.font = .systemFont(ofSize: 18)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionField: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.font = .systemFont(ofSize: 18)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save meal", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    init(didTapSave: @escaping () -> Void) {
        self.didTapSave = didTapSave
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

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(titleField)
        addSubview(descriptionLabel)
        addSubview(descriptionField)
        addSubview(saveButton)

        saveButton.addTarget(self, action: #selector(_didTapSave), for: .touchDown)

        titleField.delegate = self

        configureConstraints()
    }

    private func configureConstraints() {
        let screenWidth: CGFloat = 320
        let buttonHeight: CGFloat = 70
        let imageSize: CGFloat = 320

        NSLayoutConstraint.activate([
            // Image view
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),

            // Title label
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            titleLabel.widthAnchor.constraint(equalToConstant: screenWidth),

            // Title field
            titleField.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleField.widthAnchor.constraint(equalToConstant: screenWidth),
            titleField.heightAnchor.constraint(equalToConstant: 32),

            // Description label
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 8),
            descriptionLabel.widthAnchor.constraint(equalToConstant: screenWidth),

            // Description field
            descriptionField.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionField.widthAnchor.constraint(equalToConstant: screenWidth),
            descriptionField.heightAnchor.constraint(equalToConstant: 120),

            // Save button
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            saveButton.widthAnchor.constraint(equalToConstant: screenWidth),
            saveButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}

extension SaveFormsView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxCharacters = 32
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= maxCharacters
    }
}

extension SaveFormsView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Combine the current text with the replacement text to calculate the final text
        let currentText = textView.text as NSString
        let proposedText = currentText.replacingCharacters(in: range, with: text)

        let maxLength = 160
        return proposedText.count <= maxLength
    }
}
