//
//  ViewController.swift
//  Anim
//
//  Created by Anonymos on 25/06/2022.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController {
    let waitingView = SpeechView()
    
    let listeningView = SpeechView()
    
    let speakingView = SpeechView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        waitingView.frame = CGRect(x: 100, y: 100, width: 60, height: 60)
        waitingView.type = .waiting
        waitingView.padding = 15
        waitingView.repeatCount = 0
        waitingView.color = .white
        waitingView.backgroundImage = UIImage(named: "ic_circle")
        view.addSubview(waitingView)
        
        listeningView.frame = CGRect(x: 100, y: 200, width: 60, height: 60)
        listeningView.type = .waiting
        listeningView.padding = 15
        listeningView.color = .white
        listeningView.backgroundImage = UIImage(named: "ic_circle")
        view.addSubview(listeningView)
        
        speakingView.frame = CGRect(x: 100, y: 300, width: 60, height: 60)
        speakingView.type = .speaking
        speakingView.color = UIColor(named: "Orange")!
        speakingView.avatarImage = UIImage(named: "ic_voice")
        view.addSubview(speakingView)
    }
    //F5B659

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        waitingView.startAnimating()
   
        listeningView.startAnimating()
        
        speakingView.startAnimating()
    }

}
