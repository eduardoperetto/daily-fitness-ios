//
//  LogsView.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 17/02/23.
//

import UIKit

final class LogsView: UIView {
    // MARK: - Properties

    private let meals: [Meal]
    private let presentDetail: (Meal) -> Void

    // MARK: - Inner views

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.register(MealCell.self, forCellReuseIdentifier: "mealCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Init

    init(meals: [Meal], presentDetail: @escaping (Meal) -> Void) {
        self.meals = meals
        self.presentDetail = presentDetail
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
        addSubview(tableView)
        configureTableView()
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension LogsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealCell
        let meal = meals[indexPath.item]

        cell.setTitle(meal.title)
        cell.setDescription(meal.description)
        cell.setImage(UIImage(named: "myImage"))

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = meals[indexPath.item]
        presentDetail(meal)
    }
}
