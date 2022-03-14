//
//  CheckItemsTableViewCell.swift
//  KotaKadai15
//
//  Created by 前田航汰 on 2022/03/14.
//

import UIKit

class CheckItemsTableViewCell: UITableViewCell {

    @IBOutlet private weak var checkImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func configure(checkItem: CheckItem) {
            checkImage.isHidden = !checkItem.isChecked
            nameLabel.text = checkItem.name
    }

}
