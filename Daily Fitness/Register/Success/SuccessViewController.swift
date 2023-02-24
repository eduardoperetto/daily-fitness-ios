//
//  SuccessViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 22/02/23.
//

import UIKit

final class SuccessViewController: UIViewController {
    // MARK: - Properties

    private lazy var rootView = SuccessView(
        openHome: { [weak self] in self?.openHome() }
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

    private func openHome() {
        let homeController = HomeViewController()
        navigationController?.setViewControllers([homeController], animated: true)
    }
}
