//
//  LaunchScreenController.swift
//  UniteGuide
//
//  Created by Haden Olfers on 7/13/23.
//

import UIKit

class LaunchScreenController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.alpha = 0
        logoLabel.alpha = 0
        
        // Start the timer when the view loads
        startTimer()
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController?.overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Animate the logo view from alpha 0 to alpha 1
            UIView.animate(withDuration: 1) {
                self.logoImage.alpha = 1.0
                self.logoLabel.alpha = 1.0
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            UIView.animate(withDuration: 1) {
                self.logoImage.alpha = 0
                self.logoLabel.alpha = 0
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Invalidate the timer when the view disappears to prevent it from firing
            stopTimer()
        }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func startTimer() {
            // Schedule the timer to fire after 5 seconds
            timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: false)
        }
    
    private func stopTimer() {
            // Invalidate the timer to stop it from firing
            timer?.invalidate()
            timer = nil
        }
        
    @objc private func timerFired() {
        // Perform the segue to the NavigationController
        performSegue(withIdentifier: "launchtoNavPush", sender: nil)
    }
    
    func navigateToViewController() {
        if let window = UIApplication.shared.windows.first {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navigationController = UINavigationController(rootViewController: mainViewController)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

}
