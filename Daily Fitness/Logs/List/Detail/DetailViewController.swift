//
//  DetailViewController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 22/02/23.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - Properties

    private let meal: Meal
    private lazy var rootView = DetailView(meal: meal)

    // MARK: - Init

    init(meal: Meal) {
        self.meal = meal
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
    }
}
