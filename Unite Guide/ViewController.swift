//
//  ViewController.swift
//  Unite Guide
//
//  Created by Haden Olfers on 7/30/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.dataSource = self
        filteredNames = champions
        org()
       
    }
    func org() {
        let rankOne = filteredNames.filter { champ in
          return champ.rank == 1
        }
        let rankTwo = filteredNames.filter { champ in
          return champ.rank == 2
        }
        let rankThree = filteredNames.filter { champ in
          return champ.rank == 3
        }
        let rankFour = filteredNames.filter { champ in
          return champ.rank == 4
        }
        let rankFive = filteredNames.filter { champ in
          return champ.rank == 5
        }
        filteredNames = rankOne + rankTwo + rankThree + rankFour + rankFive
        
    }
    let defaults = UserDefaults.standard
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var laneBar: UITabBar!
    @IBOutlet var laneItems: [UITabBarItem]!
    @IBOutlet weak var top: UITabBarItem!
    @IBOutlet weak var jungle: UITabBarItem!
    @IBOutlet weak var support: UITabBarItem!
    @IBOutlet weak var bottom: UITabBarItem!
    @IBOutlet weak var table: UITableView!
    let champions = Champions().champions
    var filteredNames: [champion] = []
    
    // UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        filteredNames = []
        switch item.tag  {
        case 0:
            for champ in champions {
                if champ.position == .top || champ.secondPos == .top {
                    filteredNames.append(champ)
                    org()
                }
            }
            break
        case 1:
            for champ in champions {
                if champ.position == .jungle || champ.secondPos == .jungle {
                    filteredNames.append(champ)
                    org()
                }
            }
            break
        case 2:
            for champ in champions {
                if champ.position == .support || champ.secondPos == .support {
                    filteredNames.append(champ)
                    org()
                }
            }
            break
        case 3:
            for champ in champions {
                if champ.position == .bottom || champ.secondPos == .bottom {
                    filteredNames.append(champ)
                    org()
                }
            }
            break
        default:
            filteredNames = champions
            org()
            break
        }
        self.table.reloadData()
    }
    func rndLaneBar() {
        laneBar.layer.borderWidth = 1
        laneBar.barTintColor = .white
        laneBar.unselectedItemTintColor = .black
        laneBar.tintColor = #colorLiteral(red: 0.1620506048, green: 0.6690097451, blue: 0.8847789168, alpha: 1)
        laneBar.isTranslucent = true
        laneBar.layer.masksToBounds = true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        tableView.setContentOffset(CGPoint(x: 0, y: 25), animated: false)
        return filteredNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "champion", for: indexPath)
        let champs = filteredNames[indexPath.row]
        cell.textLabel?.text = champs.name
        if champs.rank == 1 {
            cell.imageView?.image = UIImage(named: "\(champs.name.lowercased())\(champs.rank)")
        }
        if champs.rank == 2 {
            cell.imageView?.image = UIImage(named: "\(champs.name.lowercased())\(champs.rank)")
        }
        if champs.rank == 3 {
            cell.imageView?.image = UIImage(named: "\(champs.name.lowercased())\(champs.rank)")
        }
        if champs.rank == 4 {
            cell.imageView?.image = UIImage(named: "\(champs.name.lowercased())\(champs.rank)")
        }
        if champs.rank == 5 {
            cell.imageView?.image = UIImage(named: "\(champs.name.lowercased())\(champs.rank)")
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let champion = filteredNames[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
        vc.champion = champion.name
        vc.rank = champion.rank
        if champion.position == .top {
            vc.pos = "Top"
        }
        if champion.position == .jungle {
            vc.pos = "Jungle"
        }
        if champion.position == .support {
            vc.pos = "Support"
        }
        if champion.position == .bottom {
            vc.pos = "Bottom"
        }
        if champion.secondPos == .top {
            vc.secPos = "Top"
        }
        if champion.secondPos == .jungle {
            vc.secPos = "Jungle"
        }
        if champion.secondPos == .support {
            vc.secPos = "Support"
        }
        if champion.secondPos == .bottom {
            vc.secPos = "Bottom"
        }
        vc.moveone = champion.moveOne
        vc.movetwo = champion.moveTwo
        vc.movethree = champion.moveThree
        vc.movefour = champion.moveFour
        vc.movefive = champion.moveFive
        vc.movesix = champion.moveSix
        vc.moveult = champion.moveUlt
        
        vc.bOneMoveOne = champion.bOneMoveOne
        vc.bOneMoveTwo = champion.bOneMoveTwo
        
        vc.buildOne = champion.buildOne
        vc.bOneMoveThree = champion.bOneMoveThree
        vc.bOneMoveFour = champion.bOneMoveFour
        vc.bOnebattleItem = champion.bOnebattleItem
        vc.bOneheldItemOne = champion.bOneheldItems[0]
        vc.bOneheldItemTwo = champion.bOneheldItems[1]
        vc.bOneheldItemThree = champion.bOneheldItems[2]
        
        vc.buildTwo = champion.buildTwo
        vc.bTwoMoveThree = champion.bTwoMoveThree
        vc.bTwoMoveFour = champion.bTwoMoveFour
        vc.bTwobattleItem = champion.bTwobattleItem
        vc.bTwoheldItemOne = champion.bTwoheldItems[0]
        vc.bTwoheldItemTwo = champion.bTwoheldItems[1]
        vc.bTwoheldItemThree = champion.bTwoheldItems[2]
        
        if champion.buildThree != "" {
        vc.buildThree = champion.buildThree
        vc.bThreeMoveThree = champion.bThreeMoveThree
        vc.bThreeMoveFour = champion.bThreeMoveFour
        vc.bThreebattleItem = champion.bThreebattleItem
        vc.bThreeheldItemOne = champion.bThreeheldItems[0]
        vc.bThreeheldItemTwo = champion.bThreeheldItems[1]
        vc.bThreeheldItemThree = champion.bThreeheldItems[2]
        }
        vc.ability = champion.ability
        
        if champion.counterChamps.count > 0 {
            vc.countOne = champion.counterChamps[0]
        }
        if champion.counterChamps.count > 1 {
            vc.countTwo = champion.counterChamps[1]
        }
        if champion.counterChamps.count > 2 {
            vc.countThree = champion.counterChamps[2]
        }
        self.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //UISearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredNames = []
        
        if searchText == "" {
            filteredNames = champions
        } else {
            for champ in champions {
                if champ.name.lowercased().contains(searchText.lowercased()) {
                    filteredNames.append(champ)
                }
            }
        }
        self.table.reloadData()
    }
    
}
