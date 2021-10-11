//
//  FavoritesViewController.swift
//  Unite Guide
//
//  Created by Haden Olfers on 7/31/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        favStack.removeFromSuperview()
    }
    override func viewDidAppear(_ animated: Bool) {
        loadFavs()
    }
    let defaults = UserDefaults.standard
    var favoriteChamps: [champion] = []
    var champButtons: [UIButton] = []
    var buttonOrder = 0
    let champions = Champions().champions
    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc2 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc3 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc4 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc5 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc6 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc7 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc8 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc9 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    let vc10 = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    @IBOutlet weak var favsStack: UIStackView!
    @IBOutlet weak var favStack: UIStackView!
    func generateButtons() {
        if buttonOrder == 1 {
            champButtons.append(createFavs(buttonType: .one))
        }
        if buttonOrder == 2 {
            champButtons.append(createFavs(buttonType: .two))
        }
        if buttonOrder == 3 {
            champButtons.append(createFavs(buttonType: .three))
        }
        if buttonOrder == 4 {
            champButtons.append(createFavs(buttonType: .four))
        }
        if buttonOrder == 5 {
            champButtons.append(createFavs(buttonType: .five))
        }
        if buttonOrder == 6 {
            champButtons.append(createFavs(buttonType: .six))
        }
        if buttonOrder == 7 {
            champButtons.append(createFavs(buttonType: .seven))
        }
        if buttonOrder == 8 {
            champButtons.append(createFavs(buttonType: .eight))
        }
        if buttonOrder == 9 {
            champButtons.append(createFavs(buttonType: .nine))
        }
        if buttonOrder == 10 {
            champButtons.append(createFavs(buttonType: .ten))
        }
        
    }
    func createFavs(buttonType: ButtonType) -> UIButton {
        let button = UIButton()
        for champ in favoriteChamps {
            button.setImage(UIImage(named: "\(champ.name.lowercased())\(champ.rank)"), for: .normal)
        }
        switch buttonType {
        case .one:
            vcDetails(vc: vc)
            button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        case .two:
            vcDetails(vc: vc2)
            button.addTarget(self, action:#selector(buttonClicked2), for: .touchUpInside)
        case .three:
            vcDetails(vc: vc3)
            button.addTarget(self, action:#selector(buttonClicked3), for: .touchUpInside)
        case .four:
            vcDetails(vc: vc4)
            button.addTarget(self, action:#selector(buttonClicked4), for: .touchUpInside)
        case .five:
            vcDetails(vc: vc5)
            button.addTarget(self, action:#selector(buttonClicked5), for: .touchUpInside)
        case .six:
            vcDetails(vc: vc6)
            button.addTarget(self, action:#selector(buttonClicked6), for: .touchUpInside)
        case .seven:
            vcDetails(vc: vc7)
            button.addTarget(self, action:#selector(buttonClicked7), for: .touchUpInside)
        case .eight:
            vcDetails(vc: vc8)
            button.addTarget(self, action:#selector(buttonClicked8), for: .touchUpInside)
        case .nine:
            vcDetails(vc: vc9)
            button.addTarget(self, action:#selector(buttonClicked9), for: .touchUpInside)
        case .ten:
            vcDetails(vc: vc10)
            button.addTarget(self, action:#selector(buttonClicked10), for: .touchUpInside)
        }
        button.heightAnchor.constraint(equalToConstant: 55) .isActive = true
        button.widthAnchor.constraint(equalToConstant: 55) .isActive = true
        favsStack.addArrangedSubview(button)
        
        return button
    }
    func vcDetails(vc: ChampionViewController) {
        for champ in favoriteChamps {
            vc.champion = champ.name
            vc.rank = champ.rank
            if champ.position == .top {
                vc.pos = "Top"
            }
            if champ.position == .jungle {
                vc.pos = "Jungle"
            }
            if champ.position == .support {
                vc.pos = "Support"
            }
            if champ.position == .bottom {
                vc.pos = "Bottom"
            }
            if champ.secondPos == .top {
                vc.secPos = "Top"
            }
            if champ.secondPos == .jungle {
                vc.secPos = "Jungle"
            }
            if champ.secondPos == .support {
                vc.secPos = "Support"
            }
            if champ.secondPos == .bottom {
                vc.secPos = "Bottom"
            }
            if champ.secondPos == .none {
                vc.secPos = ""
            }
            vc.moveone = champ.moveOne
            vc.movetwo = champ.moveTwo
            vc.movethree = champ.moveThree
            vc.movefour = champ.moveFour
            vc.movefive = champ.moveFive
            vc.movesix = champ.moveSix
            vc.moveult = champ.moveUlt
            
            vc.bOneMoveOne = champ.bOneMoveOne
            vc.bOneMoveTwo = champ.bOneMoveTwo
            
            vc.buildOne = champ.buildOne
            vc.bOneMoveThree = champ.bOneMoveThree
            vc.bOneMoveFour = champ.bOneMoveFour
            vc.bOnebattleItem = champ.bOnebattleItem
            vc.bOneheldItemOne = champ.bOneheldItems[0]
            vc.bOneheldItemTwo = champ.bOneheldItems[1]
            vc.bOneheldItemThree = champ.bOneheldItems[2]
            
            vc.buildTwo = champ.buildTwo
            vc.bTwoMoveThree = champ.bTwoMoveThree
            vc.bTwoMoveFour = champ.bTwoMoveFour
            vc.bTwobattleItem = champ.bTwobattleItem
            vc.bTwoheldItemOne = champ.bTwoheldItems[0]
            vc.bTwoheldItemTwo = champ.bTwoheldItems[1]
            vc.bTwoheldItemThree = champ.bTwoheldItems[2]
            
            vc.buildThree = champ.buildThree
            if vc.buildThree != "" {
                vc.bThreeMoveThree = champ.bThreeMoveThree
                vc.bThreeMoveFour = champ.bThreeMoveFour
                vc.bThreebattleItem = champ.bThreebattleItem
                vc.bThreeheldItemOne = champ.bThreeheldItems[0]
                vc.bThreeheldItemTwo = champ.bThreeheldItems[1]
                vc.bThreeheldItemThree = champ.bThreeheldItems[2]
            }
            
            vc.ability = champ.ability
            if champ.counterChamps.count > 0 {
                vc.countOne = champ.counterChamps[0]
            }
            if champ.counterChamps.count > 1 {
                vc.countTwo = champ.counterChamps[1]
            }
            if champ.counterChamps.count > 2 {
                vc.countThree = champ.counterChamps[2]
            }
        }
    }
    @objc func buttonClicked() {
        present(vc, animated: true, completion: nil)
    }
    @objc func buttonClicked2() {
        present(vc2, animated: true, completion: nil)
    }
    @objc func buttonClicked3() {
        present(vc3, animated: true, completion: nil)
    }
    @objc func buttonClicked4() {
        present(vc4, animated: true, completion: nil)
    }
    @objc func buttonClicked5() {
        present(vc5, animated: true, completion: nil)
    }
    @objc func buttonClicked6() {
        present(vc6, animated: true, completion: nil)
    }
    @objc func buttonClicked7() {
        present(vc7, animated: true, completion: nil)
    }
    @objc func buttonClicked8() {
        present(vc8, animated: true, completion: nil)
    }
    @objc func buttonClicked9() {
        present(vc9, animated: true, completion: nil)
    }
    @objc func buttonClicked10() {
        present(vc10, animated: true, completion: nil)
    }
    func champCap() {
        if favoriteChamps.count > 10 {
            favoriteChamps.removeLast()
            print("Can only have 10 favorites")
        }
    }
    func loadFavs() {
        for champ in champions {
            if defaults.bool(forKey: "\(champ.name)favorite") == true {
                if favoriteChamps.contains(champ) != true {
                    favoriteChamps.append(champ)
                    champCap()
                    buttonOrder = favoriteChamps.count
                    print(buttonOrder)
                    print(champ.name)
                    generateButtons()
                }
            }
            if defaults.bool(forKey: "\(champ.name)favorite") == false {
                if favoriteChamps.contains(champ) == true {
                    let findChamp = favoriteChamps.lastIndex(of: champ)
                    let findButton = champButtons.remove(at: findChamp!)
                    findButton.removeFromSuperview()
                    favoriteChamps.remove(at: findChamp!)
                }
            }
        }
    }
    
}

enum ButtonType {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
}
