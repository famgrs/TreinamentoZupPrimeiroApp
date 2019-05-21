//
//  LendingViewController.swift
//  PrimeiroApp
//
//  Created by Anderson Moura de Oliveira on 10/05/19.
//  Copyright © 2019 andersonOliveira. All rights reserved.
//

import UIKit

class LendingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var lendings: [Lending] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lendings = LendingService.shared.lendings.sorted().reversed()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLendingDetail" {
            
        }
    }

    private func setupStyle() {
        tableView.tableFooterView = UIView()
    }
}

extension LendingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lendings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lendingCell", for: indexPath)
        
        let lending = lendings[indexPath.row]
        cell.textLabel?.text = lending.name
        cell.detailTextLabel?.text = "\(lending.object) - \(lending.date.simpleDateFormatting())"
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLendingDetail", sender: nil)
    }
}

extension Date {
    func simpleDateFormatting() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
}
