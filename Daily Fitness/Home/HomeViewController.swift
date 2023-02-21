//
//  HomeViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Properties

    private lazy var rootView = HomeView(
        didTapLogs: { [weak self] in self?.openLogs() },
        didTapRegisterMeal: { print("2") }
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
    }

    private func openLogs() {
        let logsController = LogsViewController(viewModel: LogsViewModel())
        show(logsController, sender: self)
    }
}
