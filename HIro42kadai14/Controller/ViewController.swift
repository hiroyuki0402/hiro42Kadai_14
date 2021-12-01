//
//  ViewController.swift
//  HIro42kadai14
//
//  Created by 白石裕幸 on 2021/12/01.
//
import UIKit
class ViewController: UIViewController, GetFruitDelegate {
    @IBOutlet private weak var tableView: UITableView!
    private var fruitsInStock = FruistList().fruitsInStock

    func getFruit(checkItem: CheckItem) {
        fruitsInStock.append(CheckItem.init(name: checkItem.name, isChecked: checkItem.isChecked))
        tableView.reloadData()
    }

    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "Homesegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Homesegue" {
            guard let AddFruitVC = segue.destination as? AddFruitViewController else { return }
            AddFruitVC.delegate = self
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsInStock.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                as? FruitCell else { fatalError() }
        cell.configure(item: fruitsInStock[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
class FruitCell: UITableViewCell {
    @IBOutlet private weak var checkImgaeView: UIImageView!
    @IBOutlet private weak var fruitsNameLabel: UILabel!
    func configure(item: CheckItem) {
        fruitsNameLabel.text = item.name
        checkImgaeView.image = item.isChecked ? UIImage(named: "checkMark") : nil
    }
}

