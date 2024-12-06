//
//  ViewController.swift
//  UniteGuide
//
//  Created by Haden Olfers on 7/12/23.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    var championsList: [Champion] = []
    let defaults = UserDefaults.standard
    @IBOutlet weak var favoriteChampionView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var laneView: UIView!
    @IBOutlet var laneItems: [UIView]!
    @IBOutlet weak var any: UIView!
    @IBOutlet weak var top: UIView!
    @IBOutlet weak var jungle: UIView!
    @IBOutlet weak var bottom: UIView!
    @IBOutlet weak var anyLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var jugLabel: UILabel!
    @IBOutlet weak var botLabel: UILabel!
    @IBOutlet weak var anyUnderline: UILabel!
    @IBOutlet weak var topUnderline: UILabel!
    @IBOutlet weak var jugUnderline: UILabel!
    @IBOutlet weak var botUnderline: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tableDetailsView: UIView!
    
    @IBOutlet weak var menuButtonImage: UIImageView!
    // About Page
    @IBOutlet weak var aboutPageView: UIView!
    @IBOutlet weak var aboutBackImage: UIImageView!
    @IBOutlet weak var aboutBackBackgroundImage: UIImageView!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    
    @IBOutlet var aboutViews: [UIView] = []
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getFirebaseData()
        //resizeSearchBar()
        registerTableViewCells()
        overrideUserInterfaceStyle = .light
        
        // Set the data source for the table view
        table.dataSource = self
        table.delegate = self
        table.reloadData()
        
        // About Page
        hideAboutView()
        setUpBackButton()
        roundAboutViews()
        
        laneView.addBorder(to: .bottom, in: .gray, width: 0.30)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Firebase Data
    func getFirebaseData() {
        Champion.fetchChampions { [weak self] (champions, error) in
            if let error = error {
                print("Error fetching champions: \(error)")
                return
            }
            
            if let champions = champions {
                self?.championsList = champions.sorted(by: { [weak self] (champion1, champion2) -> Bool in
                    guard let self = self else { return false }
                    
                    let tier1 = self.convertTier(tierSrc: champion1.tier_src)
                    let tier2 = self.convertTier(tierSrc: champion2.tier_src)
                    
                    return tier1.localizedStandardCompare(tier2) == .orderedAscending
                })
                
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            }
        }
    }
    
    // Get Custom TableView Cells
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell",
                                  bundle: nil)
        table.register(textFieldCell,
                       forCellReuseIdentifier: "CustomTableViewCell")
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
    /*
    // Resize Search Bar
    func resizeSearchBar() {
        let textFieldInsideSearchBar = self.search.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.font = UIFont.systemFont(ofSize: 12)
    }*/
    
    // Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return championsList.count
    }
    /*
    // Sticky Headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UITableViewHeaderFooterView()
            // Customize the frame of your header view as needed
            headerView.contentView.backgroundColor = .white
            
            // Add your existing laneView and tableDetailsView to the headerView's contentView
            headerView.contentView.addSubview(self.laneView)
            headerView.contentView.addSubview(tableDetailsView)
            
            // Disable autoresizing mask translation for your views
            laneView.translatesAutoresizingMaskIntoConstraints = false
            tableDetailsView.translatesAutoresizingMaskIntoConstraints = false
            
            // Apply constraints to your views within the header view
            NSLayoutConstraint.activate([
                laneView.leadingAnchor.constraint(equalTo: headerView.contentView.leadingAnchor),
                laneView.topAnchor.constraint(equalTo: headerView.contentView.topAnchor),
                laneView.trailingAnchor.constraint(equalTo: headerView.contentView.trailingAnchor),
                laneView.heightAnchor.constraint(equalToConstant: 35),
                
                tableDetailsView.leadingAnchor.constraint(equalTo: headerView.contentView.leadingAnchor),
                tableDetailsView.topAnchor.constraint(equalTo: laneView.bottomAnchor),
                tableDetailsView.trailingAnchor.constraint(equalTo: headerView.contentView.trailingAnchor),
                tableDetailsView.bottomAnchor.constraint(equalTo: headerView.contentView.bottomAnchor),
                tableDetailsView.heightAnchor.constraint(equalToConstant: 25),
            ])
            
            return headerView
        }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Set the height of your section header view
        return 60
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            let champion = championsList[indexPath.row]
            cell.name.text = champion.champion_name
            // Champion Image
            loadImage(from: champion.image_src) { (image) in
                if let image = image {
                    cell.championImage.image = image
                }
            }
            // Tier
            let convertedTier = convertTier(tierSrc: champion.tier_src)
            cell.tier.text = "\(convertedTier)"
            // Tier Image
            if let tierImage = getTierImage(tier: convertedTier) {
                // Use the tierImage
                cell.tierImage.image = tierImage
            } else {
                // Handle unknown tier
                cell.tierImage.image = nil
            }
            // Positions
            let positions = organizePositions(top: champion.formatted_top, jug: champion.formatted_jungle, bottom: champion.formatted_bottom)
            let uppercasePos: String = "\(positions.position)"
            let uppercasePos2: String = "\(positions.secPosition)"
            if positions.secPosition != "None" {
                cell.position.text = "\(uppercasePos.capitalized), \(uppercasePos2.capitalized)"
            } else {
                cell.position.text = "\(uppercasePos.capitalized)"
            }
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let championVC = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            .instantiateViewController(identifier: "ChampionViewController") as! ChampionViewController
    
        let selectedChampion = championsList[indexPath.row]
        
        // Set Champion Data
        championVC.champion_name = selectedChampion.champion_name
        championVC.image_src = selectedChampion.image_src
        championVC.tier_src = selectedChampion.tier_src
        championVC.formatted_champ_role = selectedChampion.formatted_champ_role
        championVC.formatted_champ_attack_type = selectedChampion.formatted_champ_attack_type
        championVC.champ_dmg_type = selectedChampion.champ_dmg_type
        championVC.champ_cost = selectedChampion.champ_cost
        championVC.champ_gems = selectedChampion.champ_gems
        championVC.formatted_top = selectedChampion.formatted_top
        championVC.formatted_jungle = selectedChampion.formatted_jungle
        championVC.formatted_bottom = selectedChampion.formatted_bottom

        championVC.build_one_title = selectedChampion.build_one_title
        championVC.build_one_moveset_title = selectedChampion.build_one_moveset_title
        championVC.build_one_moveset_src = selectedChampion.build_one_moveset_src
        championVC.build_one_moveset_title_two = selectedChampion.build_one_moveset_title_two
        championVC.build_one_moveset_src_two = selectedChampion.build_one_moveset_src_two
        championVC.build_one_held_items = selectedChampion.build_one_held_items
        championVC.build_one_held_items_srcs = selectedChampion.build_one_held_items_srcs
        championVC.build_one_battle_item = selectedChampion.build_one_battle_item
        championVC.build_one_battle_item_src = selectedChampion.build_one_battle_item_src
        championVC.build_one_emblems = selectedChampion.build_one_emblems

        championVC.build_two_title = selectedChampion.build_two_title
        championVC.build_two_moveset_title = selectedChampion.build_two_moveset_title
        championVC.build_two_moveset_src = selectedChampion.build_two_moveset_src
        championVC.build_two_moveset_title_two = selectedChampion.build_two_moveset_title_two
        championVC.build_two_moveset_src_two = selectedChampion.build_two_moveset_src_two
        championVC.build_two_held_items = selectedChampion.build_two_held_items
        championVC.build_two_held_items_srcs = selectedChampion.build_two_held_items_srcs
        championVC.build_two_battle_item = selectedChampion.build_two_battle_item
        championVC.build_two_battle_item_src = selectedChampion.build_two_battle_item_src
        championVC.build_two_emblems = selectedChampion.build_two_emblems

        championVC.build_three_title = selectedChampion.build_three_title
        championVC.build_three_moveset_title = selectedChampion.build_three_moveset_title
        championVC.build_three_moveset_src = selectedChampion.build_three_moveset_src
        championVC.build_three_moveset_title_two = selectedChampion.build_three_moveset_title_two
        championVC.build_three_moveset_src_two = selectedChampion.build_three_moveset_src_two
        championVC.build_three_held_items = selectedChampion.build_three_held_items
        championVC.build_three_held_items_srcs = selectedChampion.build_three_held_items_srcs
        championVC.build_three_battle_item = selectedChampion.build_three_battle_item
        championVC.build_three_battle_item_src = selectedChampion.build_three_battle_item_src
        championVC.build_three_emblems = selectedChampion.build_three_emblems

        championVC.counter_champions = selectedChampion.counter_champions
        championVC.counter_champion_srcs = selectedChampion.counter_champion_srcs

        championVC.stAtk = selectedChampion.stAtk

        championVC.passAbl = selectedChampion.passAbl
        championVC.passAbl_src = selectedChampion.passAbl_src
        championVC.passAbl_Desc = selectedChampion.passAbl_Desc

        championVC.r_moves = selectedChampion.r_moves
        championVC.r_moves_lvls = selectedChampion.r_moves_lvls
        championVC.r_moves_src = selectedChampion.r_moves_src
        championVC.r_move_type = selectedChampion.r_move_type
        championVC.r_dmg_type = selectedChampion.r_dmg_type
        championVC.r_cooldown = selectedChampion.r_cooldown
        championVC.r_descs = selectedChampion.r_descs

        championVC.zr_moves = selectedChampion.zr_moves
        championVC.zr_moves_lvls = selectedChampion.zr_moves_lvls
        championVC.zr_moves_src = selectedChampion.zr_moves_src
        championVC.zr_move_type = selectedChampion.zr_move_type
        championVC.zr_dmg_type = selectedChampion.zr_dmg_type
        championVC.zr_cooldown = selectedChampion.zr_cooldown
        championVC.zr_descs = selectedChampion.zr_descs

        championVC.zl_moves = selectedChampion.zl_moves
        championVC.zl_moves_lvls = selectedChampion.zl_moves_lvls
        championVC.zl_moves_src = selectedChampion.zl_moves_src
        championVC.zl_move_type = selectedChampion.zl_move_type
        championVC.zl_dmg_type = selectedChampion.zl_dmg_type
        championVC.zl_cooldown = selectedChampion.zl_cooldown
        championVC.zl_descs = selectedChampion.zl_descs

        // Load ChampionView
        self.navigationController?.pushViewController(championVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpBackButton() {
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        aboutBackImage.isUserInteractionEnabled = true
        aboutBackImage.addGestureRecognizer(backTapGesture)
        
        let menuTapGesture = UITapGestureRecognizer(target: self, action: #selector(menuButtonTapped))
        menuButtonImage.isUserInteractionEnabled = true
        menuButtonImage.addGestureRecognizer(menuTapGesture)
    }
    
    @objc func backButtonTapped() {
        blur.alpha = 0
        aboutPageView.alpha = 0
    }
    
    @objc func menuButtonTapped() {
        blur.alpha = 0.75
        aboutPageView.alpha = 1
    }
    
    func hideAboutView() {
        aboutPageView.alpha = 0
        blur.alpha = 0
    }
    
    func roundAboutViews() {
        for view in aboutViews {
            view.layer.cornerRadius = 15
            view.layer.masksToBounds = true
        }
        aboutBackBackgroundImage.layer.cornerRadius =
        aboutBackBackgroundImage.frame.width / 2
        aboutBackBackgroundImage.clipsToBounds = true
    }
}

extension UIView {
    enum ViewSide {
        case top
        case left
        case bottom
        case right
    }

    func addBorders(to sides: [ViewSide], in color: UIColor, width: CGFloat) {
        sides.forEach { addBorder(to: $0, in: color, width: width) }
    }

    func addBorder(to side: ViewSide, in color: UIColor, width: CGFloat) {
        switch side {
        case .top:
            addTopBorder(in: color, width: width)
        case .left:
            addLeftBorder(in: color, width: width)
        case .bottom:
            addBottomBorder(in: color, width: width)
        case .right:
            addRightBorder(in: color, width: width)
        }
    }

    func addTopBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        addSubview(border)
    }

    func addBottomBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(border)
    }

    func addLeftBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        addSubview(border)
    }
}
