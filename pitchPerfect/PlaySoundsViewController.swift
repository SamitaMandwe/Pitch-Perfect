//
//  PlaySoundsViewController.swift
//  pitchPerfect
//
//  Created by Samita Mandwe on 8/9/17.
//  Copyright © 2017 udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL : URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    func configureButton(button: UIButton) {
        snailButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        rabbitButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        chipmunkButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        reverbButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        vaderButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        echoButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
   
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        let playslow: Float = 0.5
        let playfast: Float = 1.5
        let playHigh: Float = 1000
        let playLow : Float = -1000
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: playslow)
        case .fast:
            playSound(rate: playfast)
        case .chipmunk:
            playSound(pitch: playHigh)
        case .vader:
            playSound(pitch: playLow)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

    override func viewDidLoad() {
    super.viewDidLoad()
    configureButton(button: snailButton)
    configureButton(button: rabbitButton)
    configureButton(button: chipmunkButton)
    configureButton(button: reverbButton)
    configureButton(button: vaderButton)
    configureButton(button: echoButton)
    setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
      
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    }
