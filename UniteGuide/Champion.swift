import FirebaseFirestore

// Define the Champion class
struct Champion {
    let champion_name: String
    let image_src: String
    let tier_src: String
    let formatted_champ_role: String
    let formatted_champ_attack_type: String
    let champ_dmg_type: String
    let champ_cost: String
    let champ_gems: String
    let formatted_top: String
    let formatted_jungle: String
    let formatted_bottom: String
    
    let build_one_title: String
    let build_one_moveset_title: String
    let build_one_moveset_src: String
    let build_one_moveset_title_two: String
    let build_one_moveset_src_two: String
    let build_one_held_items: [String]
    let build_one_held_items_srcs: [String]
    let build_one_battle_item: String
    let build_one_battle_item_src: String
    let build_one_emblems: [String]
    
    let build_two_title: String
    let build_two_moveset_title: String
    let build_two_moveset_src: String
    let build_two_moveset_title_two: String
    let build_two_moveset_src_two: String
    let build_two_held_items: [String]
    let build_two_held_items_srcs: [String]
    let build_two_battle_item: String
    let build_two_battle_item_src: String
    let build_two_emblems: [String]
    
    let build_three_title: String
    let build_three_moveset_title: String
    let build_three_moveset_src: String
    let build_three_moveset_title_two: String
    let build_three_moveset_src_two: String
    let build_three_held_items: [String]
    let build_three_held_items_srcs: [String]
    let build_three_battle_item: String
    let build_three_battle_item_src: String
    let build_three_emblems: [String]
    
    let counter_champions: [String]
    let counter_champion_srcs: [String]
    
    let stAtk: String
    
    let passAbl: String
    let passAbl_src: String
    let passAbl_Desc: String
    
    let r_moves: [String]
    let r_moves_lvls: [String]
    let r_moves_src: [String]
    let r_move_type: [String]
    let r_dmg_type: [String]
    let r_cooldown: [String]
    let r_descs: [String]
    
    let zr_moves: [String]
    let zr_moves_lvls: [String]
    let zr_moves_src: [String]
    let zr_move_type: [String]
    let zr_dmg_type: [String]
    let zr_cooldown: [String]
    let zr_descs: [String]
    
    let zl_moves: String
    let zl_moves_lvls: String
    let zl_moves_src: String
    let zl_move_type: String
    let zl_dmg_type: String
    let zl_cooldown: String
    let zl_descs: String
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        self.champion_name = data["champion_name"] as? String ?? ""
        self.image_src = data["image_src"] as? String ?? ""
        self.tier_src = data["tier_src"] as? String ?? ""
        self.formatted_champ_role = data["formatted_champ_role"] as? String ?? ""
        self.formatted_champ_attack_type = data["formatted_champ_attack_type"] as? String ?? ""
        self.champ_dmg_type = data["champ_dmg_type"] as? String ?? ""
        self.champ_cost = data["champ_cost"] as? String ?? ""
        self.champ_gems = data["champ_gems"] as? String ?? ""
        self.formatted_top = data["formatted_top"] as? String ?? ""
        self.formatted_jungle = data["formatted_jungle"] as? String ?? ""
        self.formatted_bottom = data["formatted_bottom"] as? String ?? ""
        self.build_one_title = data["build_one_title"] as? String ?? ""
        self.build_one_moveset_title = data["build_one_moveset_title"] as? String ?? ""
        self.build_one_moveset_src = data["build_one_moveset_src"] as? String ?? ""
        self.build_one_moveset_title_two = data["build_one_moveset_title_two"] as? String ?? ""
        self.build_one_moveset_src_two = data["build_one_moveset_src_two"] as? String ?? ""
        self.build_one_held_items = data["build_one_held_items"] as? [String] ?? [""]
        self.build_one_held_items_srcs = data["build_one_held_items_srcs"] as? [String] ?? [""]
        self.build_one_battle_item = data["build_one_battle_item"] as? String ?? ""
        self.build_one_battle_item_src = data["build_one_battle_item_src"] as? String ?? ""
        self.build_one_emblems = data["build_one_emblems"] as? [String] ?? [""]
        self.build_two_title = data["build_two_title"] as? String ?? ""
        self.build_two_moveset_title = data["build_two_moveset_title"] as? String ?? ""
        self.build_two_moveset_src = data["build_two_moveset_src"] as? String ?? ""
        self.build_two_moveset_title_two = data["build_two_moveset_title_two"] as? String ?? ""
        self.build_two_moveset_src_two = data["build_two_moveset_src_two"] as? String ?? ""
        self.build_two_held_items = data["build_two_held_items"] as? [String] ?? [""]
        self.build_two_held_items_srcs = data["build_two_held_items_srcs"] as? [String] ?? [""]
        self.build_two_battle_item = data["build_two_battle_item"] as? String ?? ""
        self.build_two_battle_item_src = data["build_two_battle_item_src"] as? String ?? ""
        self.build_two_emblems = data["build_two_emblems"] as? [String] ?? [""]
        self.build_three_title = data["build_three_title"] as? String ?? ""
        self.build_three_moveset_title = data["build_three_moveset_title"] as? String ?? ""
        self.build_three_moveset_src = data["build_three_moveset_src"] as? String ?? ""
        self.build_three_moveset_title_two = data["build_three_moveset_title_two"] as? String ?? ""
        self.build_three_moveset_src_two = data["build_three_moveset_src_two"] as? String ?? ""
        self.build_three_held_items = data["build_three_held_items"] as? [String] ?? [""]
        self.build_three_held_items_srcs = data["build_three_held_items_srcs"] as? [String] ?? [""]
        self.build_three_battle_item = data["build_three_battle_item"] as? String ?? ""
        self.build_three_battle_item_src = data["build_three_battle_item_src"] as? String ?? ""
        self.build_three_emblems = data["build_three_emblems"] as? [String] ?? [""]
        
        self.counter_champions = data["counter_champions"] as? [String] ?? [""]
        self.counter_champion_srcs = data["counter_champion_srcs"] as? [String] ?? [""]
        
        self.stAtk = data["stAtk"] as? String ?? ""
        self.passAbl = data["passAbl"] as? String ?? ""
        self.passAbl_src = data["passAbl_src"] as? String ?? ""
        self.passAbl_Desc = data["passAbl_Desc"] as? String ?? ""
        self.r_moves = data["r_moves"] as? [String] ?? [""]
        self.r_moves_lvls = data["r_moves_lvls"] as? [String] ?? [""]
        self.r_moves_src = data["r_moves_src"] as? [String] ?? [""]
        self.r_move_type = data["r_move_type"] as? [String] ?? [""]
        self.r_dmg_type = data["r_dmg_type"] as? [String] ?? [""]
        self.r_cooldown = data["r_cooldown"] as? [String] ?? [""]
        self.r_descs = data["r_descs"] as? [String] ?? [""]
        self.zr_moves = data["zr_moves"] as? [String] ?? [""]
        self.zr_moves_lvls = data["zr_moves_lvls"] as? [String] ?? [""]
        self.zr_moves_src = data["zr_moves_src"] as? [String] ?? [""]
        self.zr_move_type = data["zr_move_type"] as? [String] ?? [""]
        self.zr_dmg_type = data["zr_dmg_type"] as? [String] ?? [""]
        self.zr_cooldown = data["zr_cooldown"] as? [String] ?? [""]
        self.zr_descs = data["zr_descs"] as? [String] ?? [""]
        self.zl_moves = data["zl_moves"] as? String ?? ""
        self.zl_moves_lvls = data["zl_moves_lvls"] as? String ?? ""
        self.zl_moves_src = data["zl_moves_src"] as? String ?? ""
        self.zl_move_type = data["zl_move_type"] as? String ?? ""
        self.zl_dmg_type = data["zl_dmg_type"] as? String ?? ""
        self.zl_cooldown = data["zl_cooldown"] as? String ?? ""
        self.zl_descs = data["zl_descs"] as? String ?? ""
    }

    // Function to fetch champions from Firestore
    static func fetchChampions(completion: @escaping ([Champion]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection("UniteGuideChampions").getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            var champions: [Champion] = []
            for document in snapshot?.documents ?? [] {
                if let champion = Champion(document: document) {
                    champions.append(champion)
                }
            }

            completion(champions, nil)
        }
    }

}
