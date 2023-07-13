//
//  AnotherXibViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.06.2023.
//

import UIKit

class AnotherXibViewController: UIViewController {
  
        @IBOutlet weak var tableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self

            tableView.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
        }
    }

    extension AnotherXibViewController: UITableViewDelegate {

    }

    extension AnotherXibViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            5
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            150
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self)) as! CustomTableViewCell
            // Конфігурация ячейки
            cell.configure(for: ViewModel(imageURL: "", title: "Строка \(indexPath.row)", subtitle: "Секція \(indexPath.section)"))
            return cell
        }
    }
