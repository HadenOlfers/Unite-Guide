//
//  ChampionViewController.swift
//  Unite Guide
//
//  Created by Haden Olfers on 7/31/21.
//

import UIKit

class ChampionViewController: UIViewController, UITabBarDelegate {
    var favorite = false
    var champion = ""
    var rank = 0
    var pos = ""
    var secPos = ""
    var moveone = ""
    var movetwo = ""
    var movethree = ""
    var movefour = ""
    var movefive = ""
    var movesix = ""
    var moveult = ""
   
    var bOneMoveOne = ""
    var bOneMoveTwo = ""
    
    var buildOne = ""
    var bOneMoveThree = ""
    var bOneMoveFour = ""
    var bOnebattleItem = ""
    var bOneheldItemOne = ""
    var bOneheldItemTwo = ""
    var bOneheldItemThree = ""
    
    var buildTwo = ""
    var bTwoMoveThree = ""
    var bTwoMoveFour = ""
    var bTwobattleItem = ""
    var bTwoheldItemOne = ""
    var bTwoheldItemTwo = ""
    var bTwoheldItemThree = ""
    
    var buildThree = ""
    var bThreeMoveThree = ""
    var bThreeMoveFour = ""
    var bThreebattleItem = ""
    var bThreeheldItemOne = ""
    var bThreeheldItemTwo = ""
    var bThreeheldItemThree = ""
    
    var countOne = ""
    var countTwo = ""
    var countThree = ""
    
    var ability = ""
    
    let defaults = UserDefaults.standard
    let symbolConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .light, scale: .large)
    override func viewDidLoad() {
        overrideUserInterfaceStyle = .light
        super.viewDidLoad()
        getInfo()
        onePosition()
        removeThirdBuild()
        rndPos()
        rndMoves()
        UITABBAR()
    }
    
    func RankImage() {
        if rank == 1 {
            rankImage.image = UIImage(named: "\(champion.lowercased())\(rank)")
        }
        if rank == 2 {
            rankImage.image = UIImage(named: "\(champion.lowercased())\(rank)")
        }
        if rank == 3 {
            rankImage.image = UIImage(named: "\(champion.lowercased())\(rank)")
        }
        if rank == 4 {
            rankImage.image = UIImage(named: "\(champion.lowercased())\(rank)")
        }
        if rank == 5 {
            rankImage.image = UIImage(named: "\(champion.lowercased())\(rank)")
        }
    }
    
    func getInfo() {
        RankImage()
        championName.text = champion
        positionLabel.text = pos
        secondPosLabel.text = secPos
        moveOne.image = UIImage(named: "\(moveone)")
        moveTwo.image = UIImage(named: "\(movetwo)")
        moveThree.image = UIImage(named: "\(movethree)")
        moveFour.image = UIImage(named: "\(movefour)")
        moveFive.image = UIImage(named: "\(movefive)")
        moveSix.image = UIImage(named: "\(movesix)")
        moveUlt.image = UIImage(named: "\(moveult)")
        firstMove.setImage(UIImage(named: "\(bOneMoveOne)"), for: .normal)
        secondMove.setImage(UIImage(named: "\(bOneMoveTwo)"), for: .normal)
        firstMoveDetails.setImage(UIImage(named: "\(bOneMoveOne)Details"), for: .normal)
        secondMoveDetails.setImage(UIImage(named: "\(bOneMoveTwo)Details"), for: .normal)
        tabOne.image = UIImage(named: "\(buildOne)")
        tabTwo.image = UIImage(named: "\(buildTwo)")
        tabThird.image = UIImage(named: "\(buildThree)")
        ultMove.setImage(UIImage(named: "\(moveult)"), for: .normal)
        ultMoveDetails.setImage(UIImage(named: "\(moveult)Details"), for: .normal)
        counterOne.text = countOne
        counterTwo.text = countTwo
        counterThree.text = countThree
        counterOneImage.image = UIImage(named: "\(countOne.lowercased())1")
        counterTwoImage.image = UIImage(named: "\(countTwo.lowercased())2")
        counterThreeImage.image = UIImage(named: "\(countThree.lowercased())3")
        passiveAbility.text = ability
        favoriteInfo()
    }
    
    func favoriteInfo() {
        if defaults.bool(forKey: "\(champion)favorite") == true {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        else if defaults.bool(forKey: "\(champion)favorite") == false {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    func onePosition() {
        if secPos == "" {
            secondPos.removeFromSuperview()
        }
    }
    func removeThirdBuild() {
        if buildThree == "" {
            tabView.items?.removeLast()
        }
    }
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var championName: UILabel!
    @IBOutlet weak var rankImage: UIImageView!
    
    @IBOutlet weak var moveOne: UIImageView!
    @IBOutlet weak var moveTwo: UIImageView!
    @IBOutlet weak var moveThree: UIImageView!
    @IBOutlet weak var moveFour: UIImageView!
    @IBOutlet weak var moveFive: UIImageView!
    @IBOutlet weak var moveSix: UIImageView!
    @IBOutlet weak var moveUlt: UIImageView!
    @IBOutlet var topMoves: [UIImageView] = []
    @IBOutlet var moves: [UIButton] = []
    
    @IBOutlet weak var position: UIView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var secondPos: UIView!
    @IBOutlet weak var secondPosLabel: UILabel!
    
    @IBOutlet weak var tabView: UITabBar!
    @IBOutlet weak var tabOne: UITabBarItem!
    @IBOutlet weak var tabTwo: UITabBarItem!
    @IBOutlet weak var tabThird: UITabBarItem!
    
    @IBOutlet weak var firstMove: UIButton!
    @IBOutlet weak var secondMove: UIButton!
    @IBOutlet weak var primaryMove: UIButton!
    @IBOutlet weak var secondaryMove: UIButton!
    @IBOutlet weak var ultMove: UIButton!
    
    @IBOutlet weak var moveDetailsStack: UIStackView!
    @IBOutlet weak var firstMoveDetails: UIButton!
    @IBOutlet weak var secondMoveDetails: UIButton!
    @IBOutlet weak var thirdMoveDetails: UIButton!
    @IBOutlet weak var fourthMoveDetails: UIButton!
    
    @IBOutlet weak var ultDetailsStack: UIStackView!
    @IBOutlet weak var ultMoveDetails: UIButton!
    @IBOutlet weak var blankDetails: UIButton!
    
    @IBOutlet weak var battleItem: UIButton!
    @IBOutlet weak var itemOne: UIButton!
    @IBOutlet weak var itemTwo: UIButton!
    @IBOutlet weak var itemThree: UIButton!
    @IBOutlet weak var counterOne: UILabel!
    @IBOutlet weak var counterTwo: UILabel!
    @IBOutlet weak var counterThree: UILabel!
    @IBOutlet weak var counterOneImage: UIImageView!
    @IBOutlet weak var counterTwoImage: UIImageView!
    @IBOutlet weak var counterThreeImage: UIImageView!
    @IBOutlet weak var passiveAbility: UILabel!
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func UITABBAR() {
        tabView.selectedItem = tabOne
        primaryMove.setImage(UIImage(named: "\(bOneMoveThree)"), for: .normal)
        secondaryMove.setImage(UIImage(named: "\(bOneMoveFour)"), for: .normal)
        firstMoveDetails.setImage(UIImage(named: "\(bOneMoveOne)Details"), for: .normal)
        secondMoveDetails.setImage(UIImage(named: "\(bOneMoveTwo)Details"), for: .normal)
        thirdMoveDetails.setImage(UIImage(named: "\(bOneMoveThree)Details"), for: .normal)
        fourthMoveDetails.setImage(UIImage(named: "\(bOneMoveFour)Details"), for: .normal)
        battleItem.setImage(UIImage(named: "\(bOnebattleItem)"), for: .normal)
        itemOne.setImage(UIImage(named: "\(bOneheldItemOne)"), for: .normal)
        itemTwo.setImage(UIImage(named: "\(bOneheldItemTwo)"), for: .normal)
        itemThree.setImage(UIImage(named: "\(bOneheldItemThree)"), for: .normal)
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag  {
        case 0:
            primaryMove.setImage(UIImage(named: "\(bOneMoveThree)"), for: .normal)
            secondaryMove.setImage(UIImage(named: "\(bOneMoveFour)"), for: .normal)
            thirdMoveDetails.setImage(UIImage(named: "\(bOneMoveThree)Details"), for: .normal)
            fourthMoveDetails.setImage(UIImage(named: "\(bOneMoveFour)Details"), for: .normal)
            battleItem.setImage(UIImage(named: "\(bOnebattleItem)"), for: .normal)
            itemOne.setImage(UIImage(named: "\(bOneheldItemOne)"), for: .normal)
            itemTwo.setImage(UIImage(named: "\(bOneheldItemTwo)"), for: .normal)
            itemThree.setImage(UIImage(named: "\(bOneheldItemThree)"), for: .normal)
            break
        case 1:
            primaryMove.setImage(UIImage(named: "\(bTwoMoveThree)"), for: .normal)
            secondaryMove.setImage(UIImage(named: "\(bTwoMoveFour)"), for: .normal)
            thirdMoveDetails.setImage(UIImage(named: "\(bTwoMoveThree)Details"), for: .normal)
            fourthMoveDetails.setImage(UIImage(named: "\(bTwoMoveFour)Details"), for: .normal)
            battleItem.setImage(UIImage(named: "\(bTwobattleItem)"), for: .normal)
            itemOne.setImage(UIImage(named: "\(bTwoheldItemOne)"), for: .normal)
            itemTwo.setImage(UIImage(named: "\(bTwoheldItemTwo)"), for: .normal)
            itemThree.setImage(UIImage(named: "\(bTwoheldItemThree)"), for: .normal)
            break
        case 2:
            primaryMove.setImage(UIImage(named: "\(bThreeMoveThree)"), for: .normal)
            secondaryMove.setImage(UIImage(named: "\(bThreeMoveFour)"), for: .normal)
            thirdMoveDetails.setImage(UIImage(named: "\(bThreeMoveThree)Details"), for: .normal)
            fourthMoveDetails.setImage(UIImage(named: "\(bThreeMoveFour)Details"), for: .normal)
            battleItem.setImage(UIImage(named: "\(bThreebattleItem)"), for: .normal)
            itemOne.setImage(UIImage(named: "\(bTwoheldItemOne)"), for: .normal)
            itemTwo.setImage(UIImage(named: "\(bTwoheldItemTwo)"), for: .normal)
            itemThree.setImage(UIImage(named: "\(bTwoheldItemThree)"), for: .normal)
            break
        default:
            primaryMove.setImage(UIImage(named: "\(bOneMoveThree)"), for: .normal)
            secondaryMove.setImage(UIImage(named: "\(bOneMoveFour)"), for: .normal)
            thirdMoveDetails.setImage(UIImage(named: "\(bOneMoveThree)Details"), for: .normal)
            fourthMoveDetails.setImage(UIImage(named: "\(bOneMoveFour)Details"), for: .normal)
            battleItem.setImage(UIImage(named: "\(bOnebattleItem)"), for: .normal)
            itemOne.setImage(UIImage(named: "\(bOneheldItemOne)"), for: .normal)
            itemTwo.setImage(UIImage(named: "\(bOneheldItemTwo)"), for: .normal)
            itemThree.setImage(UIImage(named: "\(bOneheldItemThree)"), for: .normal)
            break
        }
    }
    func tabBarItem(title: String, imageName: String, selectedImageName: String, tagIndex: Int) -> UITabBarItem {
            let item = UITabBarItem(title: title,
                                    image: UIImage(named: imageName),
                                    selectedImage: UIImage(named: selectedImageName))
            item.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
            item.tag = tagIndex
            return item
        }
    @IBAction func favoriteTapped(_ sender: Any) {
        if favoriteButton.image(for: .normal) == UIImage(systemName: "star") {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favorite = true
            defaults.setValue(favorite, forKey: "\(champion)favorite")
        }
        else if favoriteButton.image(for: .normal) == UIImage(systemName: "star.fill") {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            favorite = false
            defaults.setValue(favorite, forKey: "\(champion)favorite")
        }
    }
    func rndPos() {
        position.layer.cornerRadius = 2
        secondPos.layer.cornerRadius = 2
    }
    func rndMoves() {
        for tMove in topMoves {
            tMove.layer.cornerRadius = 10
            tMove.layer.masksToBounds = true
        }
        for move in moves {
            move.layer.cornerRadius = 10
            move.layer.masksToBounds = true
        }
    }
    
    //movesTapped
    @IBAction func firstMoveTapped(_ sender: Any) {
        moveDetailsStack.alpha = 1
    }
    @IBAction func secondMoveTapped(_ sender: Any) {
        moveDetailsStack.alpha = 1
    }
    @IBAction func thirdMoveTapped(_ sender: Any) {
        moveDetailsStack.alpha = 1
    }
    @IBAction func fourthMoveTapped(_ sender: Any) {
        moveDetailsStack.alpha = 1
    }
    @IBAction func ultMoveTapped(_ sender: Any) {
        ultDetailsStack.alpha = 1
    }
    
    @IBAction func firstDetailTapped(_ sender: Any) {
        moveDetailsStack.alpha = 0
    }
    @IBAction func secondDetailTapped(_ sender: Any) {
        moveDetailsStack.alpha = 0
    }
    @IBAction func thirdDetailTapped(_ sender: Any) {
        moveDetailsStack.alpha = 0
    }
    @IBAction func fourthDetailTapped(_ sender: Any) {
        moveDetailsStack.alpha = 0
    }
    @IBAction func ultDetailTapped(_ sender: Any) {
        ultDetailsStack.alpha = 0
    }
}
