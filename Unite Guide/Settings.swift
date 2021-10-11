//
//  Settings.swift
//  Unite Guide
//
//  Created by Haden Olfers on 7/31/21.
//

import UIKit
import StoreKit

class Settings: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }
    @IBOutlet weak var developer: UITableViewCell!
    @IBOutlet weak var shareApp: UITableViewCell!
    @IBOutlet weak var reviewApp: UITableViewCell!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if developer.isSelected == true {
            let screenName = "haden_olfers"
                    let appURL = NSURL(string: "twitter://user?screen_name=\(screenName)")!
                    let webURL = NSURL(string: "https://instagram.com/\(screenName)")!
                    
                    let application = UIApplication.shared
                    
                    if application.canOpenURL(appURL as URL) {
                        application.open(appURL as URL)
                    } else {
                        application.open(webURL as URL)
                    }
        }
        if shareApp.isSelected == true {
            let activityVC = UIActivityViewController(activityItems: [URL(string: "https://apps.apple.com/us/app/unite-guide/id1579979211")!], applicationActivities: nil)
                    activityVC.popoverPresentationController?.sourceView = self.view
                    
                    self.present(activityVC, animated: true, completion: nil)
        }
        if reviewApp.isSelected == true {
            SKStoreReviewController.requestReview()
        }
    }
}

class AppInfo: UIViewController {
    override func viewDidLoad() {
        
    }
        @IBOutlet weak var back: UIButton!
        @IBAction func backPresesed(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
}
