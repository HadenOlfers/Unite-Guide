//
//  CustomTableViewCell.swift
//  Unite Guide
//
//  Created by Haden Olfers on 8/21/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //@IBOutlet weak var rankSymbol: UIImageView!
    //@IBOutlet weak var rankCalc: UILabel!
    @IBOutlet weak var championImage: UIImageView!
    @IBOutlet weak var tierImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tier: UILabel!
    @IBOutlet weak var position: UILabel!
    
}
