//
//  PlayController.swift
//  Boo
//
//  Created by Ziga Besal on 31/10/15.
//  Copyright © 2015 Ziga Besal. All rights reserved.
//

import UIKit
import AVFoundation


class PlayController: UIViewController, AVAudioPlayerDelegate
{
    // MARK: Properties
    @IBOutlet weak var booButton: UIButton!
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Check if the path to the file is valid
        if let path: NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("boo", ofType: "mp3")!)
        {
            print("ALL GOOD")
            
            player = try! AVAudioPlayer(contentsOfURL: path!, fileTypeHint: "mp3")
            player.prepareToPlay()
            // player.delegate = self... Works without being set to delegate as well, not sure why or how, yet
        }
        else
        {
            // Couldn't get valid file path
            print("NOT SO GOOD...")
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: Actions
    @IBAction func playBoo(sender: UIButton)
    {
        player.play()
    }

}

