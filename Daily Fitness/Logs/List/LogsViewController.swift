//
//  LogsViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 17/02/23.
//

import UIKit

final class LogsViewController: UIViewController {
    // MARK: - Temporary mock

    private static let mealsMock: [Meal] = [
        .init(title: "Meal1", description: "Description1", imageName: "image1"),
        .init(title: "Meal2", description: "Description2", imageName: "image2"),
    ]

    // MARK: - Properties

    private let meals: [Meal] = LogsViewController.mealsMock
    private let viewModel: LogsViewModel
    private lazy var rootView = LogsView(
        meals: meals,
        presentDetail: { [weak self] in self?.presentDetail(of: $0) }
    )

    // MARK: - Init

    init(viewModel: LogsViewModel) {
        self.viewModel = viewModel
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
        title = "Meals log"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
    }

    private func presentDetail(of meal: Meal) {
        let detailController = DetailViewController(meal: meal)

        present(detailController, animated: true)
    }
}
