//
//  ViewController.swift
//  Auto Layout
//
//  Created by liga.griezne on 20/10/2023.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var styleOutletButtons: [UIButton]!
    
    @IBOutlet weak var backroundColorButton: UIButton!
    @IBOutlet weak var buttonGone: UIButton!
    @IBOutlet weak var showClockButton: UIButton!
    @IBOutlet weak var showColorsButton: UIButton!
    @IBOutlet weak var somethingButton: UIButton!
    
    @IBOutlet weak var backroundPic: UIImageView!
    
    @IBOutlet weak var clockLabel: UILabel!
    
    var timer: Timer?
    var isColorOn = false
    var isGone = false
    var whatTime = true
    var playerViewController = AVPlayerViewController()
    var player: AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .full
        dateFormatter.timeZone = .none
        let formattedDate = dateFormatter.string(from: Date())
        clockLabel.isHidden = whatTime
        clockLabel.text = formattedDate
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
        updateClock()
}
        @objc func updateClock() {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .medium
            dateFormatter.dateFormat = "HH:mm:ss.SS"
            clockLabel.text = dateFormatter.string(from: Date())
}
    
    @IBAction func backroundTapped(_ sender: Any) {
        isColorOn.toggle()
        if isColorOn {
            backroundPic.isHidden = true
            view.backgroundColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            backroundColorButton.setTitle("Color on!", for: .normal)
        
        } else {
            backroundPic.isHidden = false
            view.backgroundColor = UIColor.systemPink
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            backroundColorButton.setTitle("Color off!", for: .normal)
            
        }
    }
    
    @IBAction func buttonGoneTapped(_ sender: Any) {
        isGone.toggle()
        backroundColorButton.isHidden = isGone
        showClockButton.isHidden = isGone
        showColorsButton.isHidden = isGone
        somethingButton.isHidden = isGone
        
    }
    @IBAction func clockButton(_ sender: Any) {
        whatTime.toggle()
        clockLabel.isHidden = whatTime
            
        }
    @IBAction func hexColorPageTapped(_ sender: Any) {
        if let url = URL(string: "https://colors.dopely.top") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func videoSomething(_ sender: Any) {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Rain", ofType: "mp4")!))
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
            
    }
}

    






//#warning("Button A,B should be on the bottom of the screen, CDE, on the top")
//#warning("add button style: icon, title, color")
//#warning("when press on button I'm hiding some buttons, or changing the view color, image")
    
    
    

