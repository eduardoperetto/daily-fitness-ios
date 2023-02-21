//
//  LogsViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 17/02/23.
//

import UIKit

final class LogsViewController: UIViewController {
    // MARK: - Properties

    private let viewModel: LogsViewModel
    private lazy var rootView = LogsView()

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
}
