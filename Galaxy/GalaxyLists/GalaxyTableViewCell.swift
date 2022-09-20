//
//  GalaxyTableViewCell.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit

class GalaxyTableViewCell: UITableViewCell {
    @IBOutlet private  var imgGalaxy: UIImageView!
    @IBOutlet private  var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgGalaxy.layer.cornerRadius = 10
        imgGalaxy.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(_ data: Note){
        lbTitle.text = data.title
        imgGalaxy.image = data.img
        
    }

}
