//
//  InboxViewController.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class InboxViewController: UITableViewController {

    struct Constants {
        static let cellID = "CELL"
    }

    private let controller: InboxModelController

    init(controller: InboxModelController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        controller.updateHandler.append({[weak self] update in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        })
        controller.fetchInbox()
    }

    // MARK: Setup
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellID)
    }

    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.inbox?.messsages.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath)
        let message = self.controller.inbox?.messsages[indexPath.row]
        cell.textLabel?.text = message?.text
        return cell
    }
}
