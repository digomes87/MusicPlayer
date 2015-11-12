//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Diego Gomes on 12/11/2015.
//  Copyright © 2015 Nylon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet var playItem: UIBarButtonItem!
    @IBOutlet var stopitem: UIBarButtonItem!
    
    var audio = AVAudioPlayer()
    var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tacica",ofType: "mp3")!)
    
    //var do Button play
    
    var playMu = UIBarButtonItem()
    var stopMu: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audio = try AVAudioPlayer(contentsOfURL: audioPath)
        }catch{
            print("Audio deletado ou nome do arquivo errado !")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(sender: AnyObject) {
        
        var item = toolbar.items!
        
        if stopMu == false {
            playMu = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "PlayPause:")
            item[0] = stopitem
            toolbar.setItems(item, animated: true)
            
            audio.play()
            stopMu = true
            
        }else{
        
            var item = toolbar.items!
            playMu = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "PlayPause:")
            item[0] = playMu
            toolbar.setItems(item, animated: true)
            
            audio.pause()
            stopMu = false
        }
    }
    
    @IBAction func stop(sender: AnyObject) {
    }

}

