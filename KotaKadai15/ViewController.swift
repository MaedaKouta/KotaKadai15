//
//  ViewController.swift
//  KotaKadai15
//
//  Created by 前田航汰 on 2022/03/14.
//

import UIKit

struct CheckItem {
    var name: String
    var isChecked: Bool
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var tableView: UITableView!

    private var checkItems: [CheckItem] = [
        .init(name: "みかん", isChecked: true),
        .init(name: "りんご", isChecked: false),
        .init(name: "バナナ", isChecked: true),
        .init(name: "パイナップル", isChecked: false)
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CheckItemsTableViewCell
        cell.configure(checkItem: checkItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkItems[indexPath.row].isChecked.toggle()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }

        if identifier == "SaveNameVC" {
            guard let navigationVC = segue.destination as? UINavigationController, let saveNameVC = navigationVC.topViewController as? SaveNameViewController else {
                return
            }
            saveNameVC.delegate = self
        }
    }

    @IBAction func exit(segue: UIStoryboardSegue) {
    }

}

extension ViewController: SaveNameViewControllerDelegate {
    func saveName(name: String) {
        checkItems.append(.init(name: name, isChecked: false))
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }

}
