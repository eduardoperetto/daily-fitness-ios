//
//  SaveFormsViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

final class SaveFormsViewController: UIViewController {
    // MARK: - Properties

    private lazy var rootView = SaveFormsView(
        didTapSave: { [weak self] in self?.saveMeal() }
    )

    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupNavigation()
    }

    // MARK: - Methods

    private func setupNavigation() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Register meal"
    }

    private func saveMeal() {
        let successController = SuccessViewController()
        navigationController?.setViewControllers([successController], animated: true)
    }
}
