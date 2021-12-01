//
//  AddFruitViewController.swift
//  HIro42kadai14
//
//  Created by 白石裕幸 on 2021/12/01.
//

import UIKit

protocol GetFruitDelegate: AnyObject {
    func getFruit(checkItem: CheckItem)
}

class AddFruitViewController: UIViewController {
    @IBOutlet private weak var enterFruitTextField: UITextField!
    weak var delegate: GetFruitDelegate?
    @IBAction private func executeSaveButton(_ sender: Any) {
        guard let text = enterFruitTextField.text else { return }
        delegate?.getFruit(checkItem: .init(name: text, isChecked: false))
        navigationController?.popViewController(animated: true)
    }
}
