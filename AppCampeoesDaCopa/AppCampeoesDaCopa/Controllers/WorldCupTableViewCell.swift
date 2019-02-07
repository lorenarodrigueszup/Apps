//
//  WorldCupTableViewCell.swift
//  AppCampeoesDaCopa
//
//  Created by Lorena Rodrigues on 07/02/19.
//  Copyright © 2019 Lorena Rodrigues. All rights reserved.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {

    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var lbScoreWinner: UILabel!
    @IBOutlet weak var lbScoreVice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(with cup: WorldCup) {
        lbYear.text = String(cup.year)
        lbCountry.text = cup.country
        ivWinner.image = UIImage(named: "\(cup.winner).png")
        ivVice.image = UIImage(named: "\(cup.vice).png")
        lbWinner.text = cup.winner
        lbVice.text = cup.vice
        lbScoreWinner.text = cup.winnerScore
        lbScoreVice.text = cup.viceScore
        
    }

}
