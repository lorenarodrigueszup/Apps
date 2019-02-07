//
//  WorldCupViewController.swift
//  AppCampeoesDaCopa
//
//  Created by Lorena Rodrigues on 06/02/19.
//  Copyright © 2019 Lorena Rodrigues. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WorldCup \(worldCup.year)"
        prepareView()
    }

    func prepareView() {
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        lbWinner.text = worldCup.winner
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbVice.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }

}

extension WorldCupViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell

        let match = worldCup.matches[indexPath.section]
        let games = match.games[indexPath.row]

        cell.prepare(with: games)

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return worldCup.matches[section].stage
    }


}
