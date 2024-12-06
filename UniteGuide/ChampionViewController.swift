//
//  ChampionViewController.swift
//  UniteGuide
//
//  Created by Haden Olfers on 7/15/23.
//

import UIKit

class ChampionViewController: UIViewController {
    
    // View Controller Variables
    var favorite = false
    
    var champion_name: String = ""
    var image_src: String = ""
    var tier_src: String = ""
    var formatted_champ_role: String = ""
    var formatted_champ_attack_type: String = ""
    var champ_dmg_type: String = ""
    var champ_cost: String = ""
    var champ_gems: String = ""
    var formatted_top: String = ""
    var formatted_jungle: String = ""
    var formatted_bottom: String = ""
    var champion_moves: [String] = []

    var build_one_title: String = ""
    var build_one_moveset_title: String = ""
    var build_one_moveset_src = ""
    var build_one_moveset_title_two: String = ""
    var build_one_moveset_src_two = ""
    var build_one_held_items: [String] = []
    var build_one_held_items_srcs: [String] = []
    var build_one_battle_item: String = ""
    var build_one_battle_item_src: String = ""
    var build_one_emblems: [String] = []

    var build_two_title: String = ""
    var build_two_moveset_title: String = ""
    var build_two_moveset_src = ""
    var build_two_moveset_title_two: String = ""
    var build_two_moveset_src_two = ""
    var build_two_held_items: [String] = []
    var build_two_held_items_srcs: [String] = []
    var build_two_battle_item: String = ""
    var build_two_battle_item_src: String = ""
    var build_two_emblems: [String] = []

    var build_three_title: String = ""
    var build_three_moveset_title: String = ""
    var build_three_moveset_src = ""
    var build_three_moveset_title_two: String = ""
    var build_three_moveset_src_two = ""
    var build_three_held_items: [String] = []
    var build_three_held_items_srcs: [String] = []
    var build_three_battle_item: String = ""
    var build_three_battle_item_src: String = ""
    var build_three_emblems: [String] = []

    var counter_champions: [String] = []
    var counter_champion_srcs: [String] = []

    var stAtk: String = ""

    var passAbl: String = ""
    var passAbl_src: String = ""
    var passAbl_Desc: String = ""

    var r_moves: [String] = []
    var r_moves_lvls: [String] = []
    var r_moves_src: [String] = []
    var r_move_type: [String] = []
    var r_dmg_type: [String] = []
    var r_cooldown: [String] = []
    var r_descs: [String] = []

    var zr_moves: [String] = []
    var zr_moves_lvls: [String] = []
    var zr_moves_src: [String] = []
    var zr_move_type: [String] = []
    var zr_dmg_type: [String] = []
    var zr_cooldown: [String] = []
    var zr_descs: [String] = []

    var zl_moves: String = ""
    var zl_moves_lvls: String = ""
    var zl_moves_src: String = ""
    var zl_move_type: String = ""
    var zl_dmg_type: String = ""
    var zl_cooldown: String = ""
    var zl_descs: String = ""
    
    // UIKit
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var championImage: UIImageView!
    @IBOutlet weak var championName: UILabel!
    @IBOutlet weak var championRankBanner: UIImageView!
    @IBOutlet weak var aeosCoinsLabel: UILabel!
    @IBOutlet weak var aeosGemsLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var attackTypeLabel: UILabel!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var favoriteButtonImage: UIImageView!
    @IBOutlet weak var damageTypeLabel: UILabel!
    @IBOutlet weak var championPrimaryPositionView: UIView!
    @IBOutlet weak var championSecondaryPositionView: UIView!
    @IBOutlet weak var primaryPositionLabel: UILabel!
    @IBOutlet weak var secondaryPositionLabel: UILabel!
    
    // Champion Moves
    @IBOutlet weak var moveOne: UIImageView!
    @IBOutlet weak var moveTwo: UIImageView!
    @IBOutlet weak var moveThree: UIImageView!
    @IBOutlet weak var moveFour: UIImageView!
    @IBOutlet weak var moveFive: UIImageView!
    @IBOutlet weak var moveSix: UIImageView!
    @IBOutlet weak var moveSeven: UIImageView!
    
    // ScrollView
    // Build Views
    @IBOutlet weak var firstBuildView: UIView!
    @IBOutlet weak var secondBuildView: UIView!
    @IBOutlet weak var thirdBuildView: UIView!
    
    // First Build
    @IBOutlet weak var firstBuildLabel: UILabel!
    @IBOutlet weak var firstBuildMoveOneImage: UIImageView!
    @IBOutlet weak var firstBuildMoveOneLabel: UILabel!
    @IBOutlet weak var firstBuildMoveTwoImage: UIImageView!
    @IBOutlet weak var firstBuildMoveTwoLabel: UILabel!
    @IBOutlet weak var firstBuildBattleItemImage: UIImageView!
    @IBOutlet weak var firstBuildBattleItemLabel: UILabel!
    @IBOutlet weak var firstBuildHeldItemOneImage: UIImageView!
    @IBOutlet weak var firstBuildHeldItemOneLabel: UILabel!
    @IBOutlet weak var firstBuildHeldItemTwoImage: UIImageView!
    @IBOutlet weak var firstBuildHeldItemTwoLabel: UILabel!
    @IBOutlet weak var firstBuildHeldItemThreeImage: UIImageView!
    @IBOutlet weak var firstBuildHeldItemThreeLabel: UILabel!
    @IBOutlet weak var firstBuildEmblemOneImage: UIImageView!
    @IBOutlet weak var firstBuildEmblemOneLabel: UILabel!
    @IBOutlet weak var firstBuildEmblemTwoImage: UIImageView!
    @IBOutlet weak var firstBuildEmblemTwoLabel: UILabel!
    @IBOutlet weak var firstBuildEmblemThreeImage: UIImageView!
    @IBOutlet weak var firstBuildEmblemThreeLabel: UILabel!
    
    // Second Build
    @IBOutlet weak var secondBuildLabel: UILabel!
    @IBOutlet weak var secondBuildMoveOneImage: UIImageView!
    @IBOutlet weak var secondBuildMoveOneLabel: UILabel!
    @IBOutlet weak var secondBuildMoveTwoImage: UIImageView!
    @IBOutlet weak var secondBuildMoveTwoLabel: UILabel!
    @IBOutlet weak var secondBuildBattleItemImage: UIImageView!
    @IBOutlet weak var secondBuildBattleItemLabel: UILabel!
    @IBOutlet weak var secondBuildHeldItemOneImage: UIImageView!
    @IBOutlet weak var secondBuildHeldItemOneLabel: UILabel!
    @IBOutlet weak var secondBuildHeldItemTwoImage: UIImageView!
    @IBOutlet weak var secondBuildHeldItemTwoLabel: UILabel!
    @IBOutlet weak var secondBuildHeldItemThreeImage: UIImageView!
    @IBOutlet weak var secondBuildHeldItemThreeLabel: UILabel!
    @IBOutlet weak var secondBuildEmblemOneImage: UIImageView!
    @IBOutlet weak var secondBuildEmblemOneLabel: UILabel!
    @IBOutlet weak var secondBuildEmblemTwoImage: UIImageView!
    @IBOutlet weak var secondBuildEmblemTwoLabel: UILabel!
    @IBOutlet weak var secondBuildEmblemThreeImage: UIImageView!
    @IBOutlet weak var secondBuildEmblemThreeLabel: UILabel!
    
    // Third Build
    @IBOutlet weak var thirdBuildLabel: UILabel!
    @IBOutlet weak var thirdBuildMoveOneImage: UIImageView!
    @IBOutlet weak var thirdBuildMoveOneLabel: UILabel!
    @IBOutlet weak var thirdBuildMoveTwoImage: UIImageView!
    @IBOutlet weak var thirdBuildMoveTwoLabel: UILabel!
    @IBOutlet weak var thirdBuildBattleItemImage: UIImageView!
    @IBOutlet weak var thirdBuildBattleItemLabel: UILabel!
    @IBOutlet weak var thirdBuildHeldItemOneImage: UIImageView!
    @IBOutlet weak var thirdBuildHeldItemOneLabel: UILabel!
    @IBOutlet weak var thirdBuildHeldItemTwoImage: UIImageView!
    @IBOutlet weak var thirdBuildHeldItemTwoLabel: UILabel!
    @IBOutlet weak var thirdBuildHeldItemThreeImage: UIImageView!
    @IBOutlet weak var thirdBuildHeldItemThreeLabel: UILabel!
    @IBOutlet weak var thirdBuildEmblemOneImage: UIImageView!
    @IBOutlet weak var thirdBuildEmblemOneLabel: UILabel!
    @IBOutlet weak var thirdBuildEmblemTwoImage: UIImageView!
    @IBOutlet weak var thirdBuildEmblemTwoLabel: UILabel!
    @IBOutlet weak var thirdBuildEmblemThreeImage: UIImageView!
    @IBOutlet weak var thirdBuildEmblemThreeLabel: UILabel!
    
    // Counter Champions
    @IBOutlet weak var counterChampionOneView: UIView!
    @IBOutlet weak var counterChampionOneImage: UIImageView!
    @IBOutlet weak var counterChampionOneNameLabel: UILabel!
    @IBOutlet weak var counterChampionOneVsLabel: UILabel!
    @IBOutlet weak var counterChampionTwoView: UIView!
    @IBOutlet weak var counterChampionTwoImage: UIImageView!
    @IBOutlet weak var counterChampionTwoNameLabel: UILabel!
    @IBOutlet weak var counterChampionTwoVsLabel: UILabel!
    @IBOutlet weak var counterChampionThreeView: UIView!
    @IBOutlet weak var counterChampionThreeImage: UIImageView!
    @IBOutlet weak var counterChampionThreeNameLabel: UILabel!
    @IBOutlet weak var counterChampionThreeVsLabel: UILabel!
    @IBOutlet weak var counterChampionFourView: UIView!
    @IBOutlet weak var counterChampionFourImage: UIImageView!
    @IBOutlet weak var counterChampionFourNameLabel: UILabel!
    @IBOutlet weak var counterChampionFourVsLabel: UILabel!
    
    
    @IBOutlet var moveViews: [UIView] = []
    // Move Slot 1 (R)
    @IBOutlet weak var rMoveOneImage: UIImageView!
    @IBOutlet weak var rMoveOneLabel: UILabel!
    @IBOutlet weak var rMoveOneLvl: UILabel!
    @IBOutlet weak var rMoveOneLvlTwo: UILabel!
    @IBOutlet weak var rMoveOneMoveTypeLabel: UILabel!
    @IBOutlet weak var rMoveOneDmgTypeLabel: UILabel!
    @IBOutlet weak var rMoveOneCooldownLabel: UILabel!
    @IBOutlet weak var rMoveOneDescLabel: UILabel!
    @IBOutlet weak var rMoveTwoImage: UIImageView!
    @IBOutlet weak var rMoveTwoLabel: UILabel!
    @IBOutlet weak var rMoveTwoLvl: UILabel!
    @IBOutlet weak var rMoveTwoLvlTwo: UILabel!
    @IBOutlet weak var rMoveTwoMoveTypeLabel: UILabel!
    @IBOutlet weak var rMoveTwoDmgTypeLabel: UILabel!
    @IBOutlet weak var rMoveTwoCooldownLabel: UILabel!
    @IBOutlet weak var rMoveTwoDescLabel: UILabel!
    @IBOutlet weak var rMoveThreeImage: UIImageView!
    @IBOutlet weak var rMoveThreeLabel: UILabel!
    @IBOutlet weak var rMoveThreeLvl: UILabel!
    @IBOutlet weak var rMoveThreeLvlTwo: UILabel!
    @IBOutlet weak var rMoveThreeMoveTypeLabel: UILabel!
    @IBOutlet weak var rMoveThreeDmgTypeLabel: UILabel!
    @IBOutlet weak var rMoveThreeCooldownLabel: UILabel!
    @IBOutlet weak var rMoveThreeDescLabel: UILabel!
    // Move Slot 2 (ZR)
    @IBOutlet weak var zrMoveOneImage: UIImageView!
    @IBOutlet weak var zrMoveOneLabel: UILabel!
    @IBOutlet weak var zrMoveOneLvl: UILabel!
    @IBOutlet weak var zrMoveOneLvlTwo: UILabel!
    @IBOutlet weak var zrMoveOneMoveTypeLabel: UILabel!
    @IBOutlet weak var zrMoveOneDmgTypeLabel: UILabel!
    @IBOutlet weak var zrMoveOneCooldownLabel: UILabel!
    @IBOutlet weak var zrMoveOneDescLabel: UILabel!
    @IBOutlet weak var zrMoveTwoImage: UIImageView!
    @IBOutlet weak var zrMoveTwoLabel: UILabel!
    @IBOutlet weak var zrMoveTwoLvl: UILabel!
    @IBOutlet weak var zrMoveTwoLvlTwo: UILabel!
    @IBOutlet weak var zrMoveTwoMoveTypeLabel: UILabel!
    @IBOutlet weak var zrMoveTwoDmgTypeLabel: UILabel!
    @IBOutlet weak var zrMoveTwoCooldownLabel: UILabel!
    @IBOutlet weak var zrMoveTwoDescLabel: UILabel!
    @IBOutlet weak var zrMoveThreeImage: UIImageView!
    @IBOutlet weak var zrMoveThreeLabel: UILabel!
    @IBOutlet weak var zrMoveThreeLvl: UILabel!
    @IBOutlet weak var zrMoveThreeLvlTwo: UILabel!
    @IBOutlet weak var zrMoveThreeMoveTypeLabel: UILabel!
    @IBOutlet weak var zrMoveThreeDmgTypeLabel: UILabel!
    @IBOutlet weak var zrMoveThreeCooldownLabel: UILabel!
    @IBOutlet weak var zrMoveThreeDescLabel: UILabel!
    // Unite Move (ZL)
    @IBOutlet weak var zlMoveImage: UIImageView!
    @IBOutlet weak var zlMoveLabel: UILabel!
    @IBOutlet weak var zlMoveLvl: UILabel!
    @IBOutlet weak var zlMoveMoveTypeLabel: UILabel!
    @IBOutlet weak var zlMoveDmgTypeLabel: UILabel!
    @IBOutlet weak var zlMoveCooldownLabel: UILabel!
    @IBOutlet weak var zlMoveDescLabel: UILabel!
    // Standard Attack
    @IBOutlet weak var standardAtkImage: UIImageView!
    @IBOutlet weak var standardAtkLabel: UILabel!
    @IBOutlet weak var standardAtkDescLabel: UILabel!
    // Passive Ability
    @IBOutlet weak var passiveImage: UIImageView!
    @IBOutlet weak var passiveLabel: UILabel!
    @IBOutlet weak var passiveDescLabel: UILabel!
    
    // View Controller Opened
    override func viewDidLoad() {
        super.viewDidLoad()
        loadChampionData()
        
        setBackButton()
        setFavoriteButton()
        setBottomLineOnHeader()
        roundDmgType()
        roundMoveViews()
        roundPositionViews()
        roundAndAddBordertoCounterChampionViews()
        overrideUserInterfaceStyle = .light
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadChampionData() {
        championName.text = champion_name
        getChampionImage()
        getBannerImage()
        aeosGemsLabel.text = champ_cost
        aeosCoinsLabel.text = champ_gems
        boldTextInLabel(boldText: "Role: ", regularText: formatted_champ_role, label: roleLabel)
        boldTextInLabel(boldText: "Attack Type: ", regularText: formatted_champ_attack_type, label: attackTypeLabel)
        getChampionMoveImages()
        convertDmgType()
        getPositions()
        
        // Build One
        getBuildOne()
        // Build Two
        getBuildTwo()
        // Build Three
        getBuildThree()
        
        getCounterChampions()
        getMoveSlotOne()
        getMoveSlotTwo()
        getZLMove()
        getStandardAtk()
        getPassive()
    }
    
    func getBuildOne() {
        firstBuildLabel.text = build_one_title
        firstBuildMoveOneLabel.text = build_one_moveset_title
        loadImage(from: build_one_moveset_src) { (image) in
            if let image = image {
                self.firstBuildMoveOneImage.image = image
            }
        }
        firstBuildMoveTwoLabel.text = build_one_moveset_title_two
        loadImage(from: build_one_moveset_src_two) { (image) in
            if let image = image {
                self.firstBuildMoveTwoImage.image = image
            }
        }
        firstBuildBattleItemLabel.text = build_one_battle_item
        loadImage(from: build_one_battle_item_src) { (image) in
            if let image = image {
                self.firstBuildBattleItemImage.image = image
            }
        }
        // Build One Held Items
        firstBuildHeldItemOneLabel.text = build_one_held_items[0]
        firstBuildHeldItemTwoLabel.text = build_one_held_items[1]
        firstBuildHeldItemThreeLabel.text = build_one_held_items[2]
        loadImage(from: build_one_held_items_srcs[0]) { (image) in
            if let image = image {
                self.firstBuildHeldItemOneImage.image = image
            }
        }
        loadImage(from: build_one_held_items_srcs[1]) { (image) in
            if let image = image {
                self.firstBuildHeldItemTwoImage.image = image
            }
        }
        loadImage(from: build_one_held_items_srcs[2]) { (image) in
            if let image = image {
                self.firstBuildHeldItemThreeImage.image = image
            }
        }
              
        updateEmblems(
            emblems: build_one_emblems,
            label1: firstBuildEmblemOneLabel,
            image1: firstBuildEmblemOneImage,
            label2: firstBuildEmblemTwoLabel,
            image2: firstBuildEmblemTwoImage,
            label3: firstBuildEmblemThreeLabel,
            image3: firstBuildEmblemThreeImage
        )
    }
    
    func getBuildTwo() {
        if build_two_title != "" {
            secondBuildLabel.text = build_two_title
            secondBuildMoveOneLabel.text = build_two_moveset_title
            loadImage(from: build_two_moveset_src) { (image) in
                if let image = image {
                    self.secondBuildMoveOneImage.image = image
                }
            }
            secondBuildMoveTwoLabel.text = build_two_moveset_title_two
            loadImage(from: build_two_moveset_src_two) { (image) in
                if let image = image {
                    self.secondBuildMoveTwoImage.image = image
                }
            }
            secondBuildBattleItemLabel.text = build_two_battle_item
            loadImage(from: build_two_battle_item_src) { (image) in
                if let image = image {
                    self.secondBuildBattleItemImage.image = image
                }
            }
            // Build One Held Items
            secondBuildHeldItemOneLabel.text = build_two_held_items[0]
            secondBuildHeldItemTwoLabel.text = build_two_held_items[1]
            secondBuildHeldItemThreeLabel.text = build_two_held_items[2]
            loadImage(from: build_two_held_items_srcs[0]) { (image) in
                if let image = image {
                    self.secondBuildHeldItemOneImage.image = image
                }
            }
            loadImage(from: build_two_held_items_srcs[1]) { (image) in
                if let image = image {
                    self.secondBuildHeldItemTwoImage.image = image
                }
            }
            loadImage(from: build_two_held_items_srcs[2]) { (image) in
                if let image = image {
                    self.secondBuildHeldItemThreeImage.image = image
                }
            }
            
            updateEmblems(
                emblems: build_two_emblems,
                label1: secondBuildEmblemOneLabel,
                image1: secondBuildEmblemOneImage,
                label2: secondBuildEmblemTwoLabel,
                image2: secondBuildEmblemTwoImage,
                label3: secondBuildEmblemThreeLabel,
                image3: secondBuildEmblemThreeImage
            )
        } else {
            secondBuildView.removeFromSuperview()
        }
    }
    
    func getBuildThree() {
        if build_three_title != "" {
            thirdBuildLabel.text = build_three_title
            thirdBuildMoveOneLabel.text = build_three_moveset_title
            loadImage(from: build_three_moveset_src) { (image) in
                if let image = image {
                    self.thirdBuildMoveOneImage.image = image
                }
            }
            thirdBuildMoveTwoLabel.text = build_three_moveset_title_two
            loadImage(from: build_three_moveset_src_two) { (image) in
                if let image = image {
                    self.thirdBuildMoveTwoImage.image = image
                }
            }
            thirdBuildBattleItemLabel.text = build_three_battle_item
            loadImage(from: build_three_battle_item_src) { (image) in
                if let image = image {
                    self.thirdBuildBattleItemImage.image = image
                }
            }
            // Build One Held Items
            thirdBuildHeldItemOneLabel.text = build_three_held_items[0]
            thirdBuildHeldItemTwoLabel.text = build_three_held_items[1]
            thirdBuildHeldItemThreeLabel.text = build_three_held_items[2]
            loadImage(from: build_three_held_items_srcs[0]) { (image) in
                if let image = image {
                    self.thirdBuildHeldItemOneImage.image = image
                }
            }
            loadImage(from: build_three_held_items_srcs[1]) { (image) in
                if let image = image {
                    self.thirdBuildHeldItemTwoImage.image = image
                }
            }
            loadImage(from: build_three_held_items_srcs[2]) { (image) in
                if let image = image {
                    self.thirdBuildHeldItemThreeImage.image = image
                }
            }
            
            updateEmblems(
                emblems: build_three_emblems,
                label1: thirdBuildEmblemOneLabel,
                image1: thirdBuildEmblemOneImage,
                label2: thirdBuildEmblemTwoLabel,
                image2: thirdBuildEmblemTwoImage,
                label3: thirdBuildEmblemThreeLabel,
                image3: thirdBuildEmblemThreeImage
            )
        } else {
            thirdBuildView.removeFromSuperview()
        }
    }
    
    func getCounterChampions() {
        if counter_champions.count < 5 {
            counterChampionOneNameLabel.text = removeImageWord(from: counter_champions[0])
            loadImage(from: counter_champion_srcs[0]) { (image) in
                if let image = image {
                    self.counterChampionOneImage.image = image
                }
            }
            counterChampionTwoNameLabel.text = removeImageWord(from: counter_champions[1])
            loadImage(from: counter_champion_srcs[1]) { (image) in
                if let image = image {
                    self.counterChampionTwoImage.image = image
                }
            }
            
            counterChampionThreeNameLabel.text = removeImageWord(from: counter_champions[2])
            loadImage(from: counter_champion_srcs[2]) { (image) in
                if let image = image {
                    self.counterChampionThreeImage.image = image
                }
            }
            counterChampionFourNameLabel.text = removeImageWord(from: counter_champions[3])
            loadImage(from: counter_champion_srcs[3]) { (image) in
                if let image = image {
                    self.counterChampionFourImage.image = image
                }
            }
        }
        
        if counter_champions.count < 4 {
            counterChampionOneNameLabel.text = removeImageWord(from: counter_champions[0])
            loadImage(from: counter_champion_srcs[0]) { (image) in
                if let image = image {
                    self.counterChampionOneImage.image = image
                }
            }
            counterChampionTwoNameLabel.text = removeImageWord(from: counter_champions[1])
            loadImage(from: counter_champion_srcs[1]) { (image) in
                if let image = image {
                    self.counterChampionTwoImage.image = image
                }
            }
            
            counterChampionThreeNameLabel.text = removeImageWord(from: counter_champions[2])
            loadImage(from: counter_champion_srcs[2]) { (image) in
                if let image = image {
                    self.counterChampionThreeImage.image = image
                }
            }
            counterChampionFourView.removeFromSuperview()
        }
        
        if counter_champions.count < 3 {
            counterChampionOneNameLabel.text = removeImageWord(from: counter_champions[0])
            loadImage(from: counter_champion_srcs[0]) { (image) in
                if let image = image {
                    self.counterChampionOneImage.image = image
                }
            }
            counterChampionTwoNameLabel.text = removeImageWord(from: counter_champions[1])
            loadImage(from: counter_champion_srcs[1]) { (image) in
                if let image = image {
                    self.counterChampionTwoImage.image = image
                }
            }
            
            counterChampionThreeView.removeFromSuperview()
            counterChampionFourView.removeFromSuperview()
        }
        
        if counter_champions.count < 2 {
            counterChampionOneNameLabel.text = removeImageWord(from: counter_champions[0])
            loadImage(from: counter_champion_srcs[0]) { (image) in
                if let image = image {
                    self.counterChampionOneImage.image = image
                }
            }
            
            counterChampionTwoView.removeFromSuperview()
            counterChampionThreeView.removeFromSuperview()
            counterChampionFourView.removeFromSuperview()
        }
    }
    
    func getMoveSlotOne() {
        // rMove 1
        rMoveOneLabel.text = r_moves[0]
        loadImage(from: r_moves_src[0]) { (image) in
            if let image = image {
                self.rMoveOneImage.image = image
            }
        }
        assignSplitStringAtUpgrade(r_moves_lvls[0], to: rMoveOneLvl, and: rMoveOneLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: r_move_type[0], label: rMoveOneMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: r_dmg_type[0], label: rMoveOneDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: r_cooldown[0], label: rMoveOneCooldownLabel)
        rMoveOneDescLabel.text = r_descs[0]
        
        // rMove 2
        rMoveTwoLabel.text = r_moves[1]
        loadImage(from: r_moves_src[1]) { (image) in
            if let image = image {
                self.rMoveTwoImage.image = image
            }
        }
        assignSplitStringAtUpgrade(r_moves_lvls[1], to: rMoveTwoLvl, and: rMoveTwoLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: r_move_type[1], label: rMoveTwoMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: r_dmg_type[1], label: rMoveTwoDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: r_cooldown[1], label: rMoveTwoCooldownLabel)
        rMoveTwoDescLabel.text = r_descs[1]
        
        // rMove 3
        rMoveThreeLabel.text = r_moves[2]
        loadImage(from: r_moves_src[2]) { (image) in
            if let image = image {
                self.rMoveThreeImage.image = image
            }
        }
        assignSplitStringAtUpgrade(r_moves_lvls[2], to: rMoveThreeLvl, and: rMoveThreeLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: r_move_type[2], label: rMoveThreeMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: r_dmg_type[2], label: rMoveThreeDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: r_cooldown[2], label: rMoveThreeCooldownLabel)
        rMoveThreeDescLabel.text = r_descs[2]
    }
    
    func getMoveSlotTwo() {
        // zrMove 1
        zrMoveOneLabel.text = zr_moves[0]
        loadImage(from: zr_moves_src[0]) { (image) in
            if let image = image {
                self.zrMoveOneImage.image = image
            }
        }
        assignSplitStringAtUpgrade(zr_moves_lvls[0], to: zrMoveOneLvl, and: zrMoveOneLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: zr_move_type[0], label: zrMoveOneMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: zr_dmg_type[0], label: zrMoveOneDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: zr_cooldown[0], label: zrMoveOneCooldownLabel)
        zrMoveOneDescLabel.text = zr_descs[0]
        
        // zrMove 2
        zrMoveTwoLabel.text = zr_moves[1]
        loadImage(from: zr_moves_src[1]) { (image) in
            if let image = image {
                self.zrMoveTwoImage.image = image
            }
        }
        assignSplitStringAtUpgrade(zr_moves_lvls[1], to: zrMoveTwoLvl, and: zrMoveTwoLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: zr_move_type[1], label: zrMoveTwoMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: zr_dmg_type[1], label: zrMoveTwoDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: zr_cooldown[1], label: zrMoveTwoCooldownLabel)
        zrMoveTwoDescLabel.text = zr_descs[1]
        
        // zrMove 3
        zrMoveThreeLabel.text = zr_moves[2]
        loadImage(from: zr_moves_src[2]) { (image) in
            if let image = image {
                self.zrMoveThreeImage.image = image
            }
        }
        assignSplitStringAtUpgrade(zr_moves_lvls[2], to: zrMoveThreeLvl, and: zrMoveThreeLvlTwo)
        boldTextInLabel(boldText: "Move Type: ", regularText: zr_move_type[2], label: zrMoveThreeMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: zr_dmg_type[2], label: zrMoveThreeDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: zr_cooldown[2], label: zrMoveThreeCooldownLabel)
        zrMoveThreeDescLabel.text = zr_descs[2]
    }
    
    func getZLMove() {
        // zlMove
        zlMoveLabel.text = zl_moves
        loadImage(from: zl_moves_src) { (image) in
            if let image = image {
                self.zlMoveImage.image = image
            }
        }
        zlMoveLvl.text = zl_moves_lvls
        boldTextInLabel(boldText: "Move Type: ", regularText: zl_move_type, label: zlMoveMoveTypeLabel)
        boldTextInLabel(boldText: "Damage Type: ", regularText: zl_dmg_type, label: zlMoveDmgTypeLabel)
        boldTextInLabel(boldText: "Cooldown: ", regularText: zl_cooldown, label: zlMoveCooldownLabel)
        zlMoveDescLabel.text = zl_descs
    }
    
    func getStandardAtk() {
        // std. ATK
        standardAtkDescLabel.text = stAtk
    }
    
    func getPassive() {
        passiveLabel.text = passAbl
        loadImage(from: passAbl_src) { (image) in
            if let image = image {
                self.passiveImage.image = image
            }
        }
        passiveDescLabel.text = passAbl_Desc
    }
    
    // Assign Levels to Split
    func assignSplitStringAtUpgrade(_ input: String, to firstLabel: UILabel, and secondLabel: UILabel) {
        let (firstPart, secondPart) = splitStringAtUpgrade(input)
        firstLabel.text = firstPart
        secondLabel.text = secondPart
    }
    
    // Split Level String
    func splitStringAtUpgrade(_ input: String) -> (String, String) {
        if let range = input.range(of: "Upgrade") {
            let firstPart = String(input[input.startIndex..<range.lowerBound]).trimmingCharacters(in: .whitespaces)
            let secondPart = String(input[range.lowerBound..<input.endIndex]).trimmingCharacters(in: .whitespaces)
            return (firstPart, secondPart)
        } else {
            return (input, "")
        }
    }
    
    func updateEmblems(emblems: [String], label1: UILabel?, image1: UIImageView?, label2: UILabel?, image2: UIImageView?, label3: UILabel?, image3: UIImageView?) {

        if emblems.count > 0 {
            label1?.text = removeBoostAndEmblem(from: emblems[0])
            image1?.image = UIImage(named: transformEmblemString(emblems[0]))
        } else {
            label1?.text = ""
            image1?.image = nil
        }

        if emblems.count > 1 {
            label2?.text = removeBoostAndEmblem(from: emblems[1])
            image2?.image = UIImage(named: transformEmblemString(emblems[1]))
        } else {
            label2?.text = ""
            image2?.image = nil
        }

        if emblems.count > 2 {
            label3?.text = removeBoostAndEmblem(from: emblems[2])
            image3?.image = UIImage(named: transformEmblemString(emblems[2]))
        } else {
            label3?.text = ""
            image3?.image = nil
        }
    }

    
    // Src to Image
    func getChampionMoveImages() {
        // Champion Moves
        for r_move in r_moves_src {
            champion_moves.append(r_move)
        }
        for zr_move in zr_moves_src {
            champion_moves.append(zr_move)
        }
        champion_moves.append(zl_moves_src)
        loadImage(from: champion_moves[0]) { (image) in
            if let image = image {
                self.moveOne.image = image
            }
        }
        loadImage(from: champion_moves[1]) { (image) in
            if let image = image {
                self.moveTwo.image = image
            }
        }
        loadImage(from: champion_moves[2]) { (image) in
            if let image = image {
                self.moveThree.image = image
            }
        }
        loadImage(from: champion_moves[3]) { (image) in
            if let image = image {
                self.moveFour.image = image
            }
        }
        loadImage(from: champion_moves[4]) { (image) in
            if let image = image {
                self.moveFive.image = image
            }
        }
        loadImage(from: champion_moves[5]) { (image) in
            if let image = image {
                self.moveSix.image = image
            }
        }
        loadImage(from: champion_moves[6]) { (image) in
            if let image = image {
                self.moveSeven.image = image
            }
        }
    }
    
    // Champion Image
    func getChampionImage() {
        // Champion Image
        loadImage(from: image_src) { (image) in
            if let image = image {
                self.championImage.image = image
            }
        }
    }
    
    // Banner
    func getBannerImage() {
        // Banner Image
        let convertedTier = convertTier(tierSrc: tier_src)
        // Tier Image
        if let tierImage = getTierImage(tier: convertedTier) {
            // Use the tierImage
            championRankBanner.image = tierImage
        } else {
            // Handle unknown tier
            championRankBanner.image = nil
        }
    }
    
    // Positions
    func getPositions() {
        let positions = organizePositions(top: formatted_top, jug: formatted_jungle, bottom: formatted_bottom)
        let uppercasePos: String = "\(positions.position)"
        let uppercasePos2: String = "\(positions.secPosition)"
        if positions.secPosition != "None" || positions.secPosition != "" {
            primaryPositionLabel.text = "\(uppercasePos.uppercased())"
            secondaryPositionLabel.text = "\(uppercasePos2.uppercased())"
        } else {
            primaryPositionLabel.text = "\(uppercasePos.uppercased())"
        }
    }
    
    func convertDmgType() {
        if champ_dmg_type == "Physical" {
            damageTypeLabel.text = "Attack"
        } else {
            damageTypeLabel.text = "Sp.Atk"
        }
    }
    
    // Bold Text Function
    func boldTextInLabel(boldText: String, regularText: String, label: UILabel) {
        let attributedText = NSMutableAttributedString(string: boldText + regularText)
        
        attributedText.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: label.font.pointSize)
        ], range: NSRange(location: 0, length: boldText.count))
        
        label.attributedText = attributedText
    }
    
    func transformEmblemString(_ input: String) -> String {
        let components = input.components(separatedBy: " ")

        // Get the first word and convert it to lowercase
        let firstWord = components.first?.lowercased() ?? ""

        // Remove any whitespace or non-alphanumeric characters from the first word
        let allowedCharacters = CharacterSet.alphanumerics
        let trimmedFirstWord = firstWord.trimmingCharacters(in: allowedCharacters.inverted)

        return trimmedFirstWord + "Emblem"
    }

    // Stars to Positions Filter
    func organizePositions(top: String, jug: String, bottom: String) -> (position: String, secPosition: String) {
        let positions = [
            "Top": top,
            "Jungle": jug,
            "Bottom": bottom
        ]
        
        let sortedPositions = positions.sorted { $0.value > $1.value }
        
        var position = ""
        var secPosition = ""
        
        if let firstPosition = sortedPositions.first {
            position = firstPosition.key
            
            if let secondPosition = sortedPositions.dropFirst().first {
                secPosition = secondPosition.value < "2 Stars" ? "None" : secondPosition.key
            }
        }
        
        return (position: position, secPosition: secPosition)
    }
    
    // Convert SS to Tiers
    func convertTier(tierSrc: String) -> String {
        switch tierSrc {
        case "SS Rank Icon":
            return "Tier 1"
        case "S Rank Icon":
            return "Tier 2"
        case "A Rank Icon":
            return "Tier 3"
        case "B Rank Icon":
            return "Tier 4"
        case "C Rank Icon":
            return "Tier 5"
        default:
            return "Unknown Tier"
        }
    }
    
    // Filter Tier Image
    func getTierImage(tier: String) -> UIImage? {
        switch tier {
        case "Tier 1":
            return UIImage(named: "rankOneIcon")
        case "Tier 2":
            return UIImage(named: "rankTwoIcon")
        case "Tier 3":
            return UIImage(named: "rankThreeIcon")
        case "Tier 4":
            return UIImage(named: "rankFourIcon")
        case "Tier 5":
            return UIImage(named: "rankFiveIcon")
        default:
            return nil
        }
    }
    
    // Create a shared URL cache for caching the downloaded images
    let imageCache = URLCache(memoryCapacity: 50 * 1024 * 1024, diskCapacity: 100 * 1024 * 1024, diskPath: "imageCache")

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        // Check if the image is already in the cache
        if let cachedResponse = imageCache.cachedResponse(for: URLRequest(url: imageUrl)) {
            let image = UIImage(data: cachedResponse.data)
            completion(image)
            return
        }
        
        // Download the image asynchronously
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, let response = response, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            // Store the downloaded image in the cache
            let cachedResponse = CachedURLResponse(response: response, data: data)
            self.imageCache.storeCachedResponse(cachedResponse, for: URLRequest(url: imageUrl))
            
            // Decode the image data in the background
            DispatchQueue.global(qos: .userInitiated).async {
                let image = UIImage(data: data, scale: 1)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    // Remove Boost and Emblem
    func removeBoostAndEmblem(from input: String) -> String {
        let modifiedString = input.replacingOccurrences(of: "\\s+(Boost|Emblem)\\b", with: "", options: .regularExpression)
        return modifiedString.trimmingCharacters(in: .whitespaces)
    }
    
    // Remove "Image" String from Counter Champions
    func removeImageWord(from input: String) -> String {
        let modifiedString = input.replacingOccurrences(of: " Image", with: "")
        return modifiedString
    }

    // Back Button
    func setBackButton() {
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backButtonImage.isUserInteractionEnabled = true
        backButtonImage.addGestureRecognizer(backTapGesture)
    }
    
    @objc func backTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // FavoritesButton
    func setFavoriteButton() {
        let favTapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteTapped))
        favoriteButtonImage.isUserInteractionEnabled = true
        favoriteButtonImage.addGestureRecognizer(favTapGesture)
    }
    
    @objc func favoriteTapped() {
        if favoriteButtonImage.image == UIImage(named: "pokeball-icon") {
            favoriteButtonImage.image = UIImage(named: "pokeball-icon-filled")
        } else {
            favoriteButtonImage.image = UIImage(named: "pokeball-icon")
        }
    }
    
    // Round Move View
    func roundMoveViews() {
        for move in moveViews {
            move.layer.cornerRadius = 5
            move.layer.borderColor = UIColor.secondarySystemFill.cgColor
            move.layer.borderWidth = 1
            move.layer.masksToBounds = true
        }
    }
    
    // Round Damage Type
    func roundDmgType() {
        damageTypeLabel.layer.cornerRadius = 10
        damageTypeLabel.layer.masksToBounds = true
    }
    
    // Round Position Views
    func roundPositionViews() {
        championPrimaryPositionView.layer.cornerRadius = 5
        championPrimaryPositionView.layer.masksToBounds = true
        
        championSecondaryPositionView.layer.cornerRadius = 5
        championSecondaryPositionView.layer.masksToBounds = true
    }
    
    // Round Counter Champion Views
    func roundAndAddBordertoCounterChampionViews() {
        counterChampionOneView.layer.cornerRadius = 5
        counterChampionOneView.layer.borderColor = UIColor.secondarySystemFill.cgColor
        counterChampionOneView.layer.borderWidth = 1
        counterChampionOneView.layer.masksToBounds = true
        counterChampionOneVsLabel.layer.cornerRadius = 5
        counterChampionOneVsLabel.layer.masksToBounds = true
        
        counterChampionTwoView.layer.cornerRadius = 5
        counterChampionTwoView.layer.borderColor = UIColor.secondarySystemFill.cgColor
        counterChampionTwoView.layer.borderWidth = 1
        counterChampionTwoView.layer.masksToBounds = true
        counterChampionTwoVsLabel.layer.cornerRadius = 5
        counterChampionTwoVsLabel.layer.masksToBounds = true
        
        counterChampionThreeView.layer.cornerRadius = 5
        counterChampionThreeView.layer.borderColor = UIColor.secondarySystemFill.cgColor
        counterChampionThreeView.layer.borderWidth = 1
        counterChampionThreeView.layer.masksToBounds = true
        counterChampionThreeVsLabel.layer.cornerRadius = 5
        counterChampionThreeVsLabel.layer.masksToBounds = true
        
        counterChampionFourView.layer.cornerRadius = 5
        counterChampionFourView.layer.borderColor = UIColor.secondarySystemFill.cgColor
        counterChampionFourView.layer.borderWidth = 1
        counterChampionFourView.layer.masksToBounds = true
        counterChampionFourVsLabel.layer.cornerRadius = 5
        counterChampionFourVsLabel.layer.masksToBounds = true
    }
    
    // Header Boarder
    func setBottomLineOnHeader() {
        headerView.addBorder(to: .bottom, in: .gray, width: 0.30)
    }
    
}
