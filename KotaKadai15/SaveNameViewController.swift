//
//  SaveNameViewController.swift
//  KotaKadai15
//
//  Created by 前田航汰 on 2022/03/14.
//

import UIKit

protocol SaveNameDelegate: AnyObject {
    func saveName(name: String)
}

class SaveNameViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    weak var delegate: SaveNameDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty {
            delegate?.saveName(name: name)
        } else {
            errorLabel.text = "値が入力されていません"
            return
        }
    }

}
