//
//  SplashVC.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    
    @IBOutlet weak var animationView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animation()
        self.endSplash()
    }
    
    func animation() -> Void {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("animation")
        animationView.contentMode = .scaleAspectFit
        animationView.frame = view.bounds
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.play()
    }
    
    func endSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else {return}
            self.performSegue(withIdentifier: "segueToNextScreen", sender:self)
        }
        
    }

}
