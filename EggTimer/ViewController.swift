//
//  ViewController.swift
//  EggTimer
//
//  Created by pop on 1/1/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player = AVAudioPlayer()
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var titleLB: UILabel!
    let eggTime = ["soft" : 6 , "medium":10,"hard":50]
    var timer = Timer()
    var totalTime = 0
    var secondpassed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hardnessBtnSelected(_ sender: UIButton) {
        timer.invalidate() // to stpe previous timer
        let hardness = sender.currentTitle!
         totalTime = eggTime[hardness]!
        progressbar.progress = 0.0
        secondpassed = 0
        titleLB.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer(){
        if secondpassed<totalTime {
            secondpassed += 1
            progressbar.progress = Float(secondpassed) / Float(totalTime)
            print(Float(secondpassed) / Float(totalTime))
           
        }else{
            timer.invalidate()
            titleLB.text = "Done"
            gettitle()
        }
    }
    
    func gettitle(){
        let url = Bundle.main.url(forResource: "F", withExtension: "wav")
        do{
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{print(error.localizedDescription)}
    }
    
    
    
    
    
}

