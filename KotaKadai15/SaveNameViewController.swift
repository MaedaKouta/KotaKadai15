//
//  SaveNameViewController.swift
//  KotaKadai15
//
//  Created by 前田航汰 on 2022/03/14.
//

import UIKit

protocol SaveNameViewControllerDelegate: AnyObject {
    func saveName(name: String)
}

class SaveNameViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    weak var delegate: SaveNameViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            errorLabel.text = "値が入力されていません"
            return
        }

        delegate?.saveName(name: name)
    }

}
