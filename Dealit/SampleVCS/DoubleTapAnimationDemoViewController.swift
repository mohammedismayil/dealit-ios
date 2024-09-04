//
//  DoubleTapAnimationDemoViewController.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 04/09/24.
//

import Foundation
import UIKit
import FLAnimatedImage

class DoubleTapAnimationDemoViewController: UIViewController {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.clear.cgColor
        label.clipsToBounds = true
        label.text = "Hello guys"
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.clear.cgColor
        label.clipsToBounds = true
//        label.text = "👍"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    var animatedImageView: FLAnimatedImageView!
    
    override func viewDidLoad() {
        print("DoubleTapAnimationDemoViewController loaded")
        self.view.addSubview(messageLabel)
        self.view.addSubview(emojiLabel)
        self.view.backgroundColor = .white
        messageLabel.frame = CGRect(x: 60, y: 100, width: 150, height: 50)
        
        emojiLabel.frame = CGRect(x: 60, y: 170, width: 30, height: 30)
        
        animatedImageView = FLAnimatedImageView()
        animatedImageView.frame = emojiLabel.frame
        animatedImageView.contentMode = .scaleAspectFit
        view.addSubview(animatedImageView)
        animatedImageView.isHidden = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        gesture.numberOfTapsRequired = 2
        messageLabel.addGestureRecognizer(gesture)
    }
    
    @objc func doubleTapAction() {
        print("Double tap action")
//        if let gifFrames = loadGifFrames(gifName: "thumbsup") {
//            animateGifOnLabel(gifFrames: gifFrames)
//        }
        
        if let gifUrl = Bundle.main.url(forResource: "thumbsup", withExtension: "gif") {
            let gifData = try? Data(contentsOf: gifUrl)
            let animatedImage = FLAnimatedImage(animatedGIFData: gifData)
            animateGifOnLabel(animatedImage: animatedImage)
        }
    }
    
    func animateGifOnLabel(animatedImage: FLAnimatedImage?) {
        // Hide the label and show the animated image view
        self.emojiLabel.text = ""
        animatedImageView.isHidden = false

        // Set the FLAnimatedImage
        animatedImageView.animatedImage = animatedImage
        
        // Automatically remove the GIF after it plays (assuming it’s a non-looping GIF)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Adjust duration based on the GIF length
            self.animatedImageView.isHidden = true
            self.emojiLabel.text = "👍"
        }
    }
 
    func loadGifFrames(gifName: String) -> [UIImage]? {
        guard let path = Bundle.main.path(forResource: gifName, ofType: "gif"),
              let data = NSData(contentsOfFile: path),
              let source = CGImageSourceCreateWithData(data, nil) else {
            return nil
        }

        var images: [UIImage] = []
        let count = CGImageSourceGetCount(source)
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frameImage = UIImage(cgImage: cgImage)
                images.append(frameImage)
            }
        }
        
        return images
    }

    
    func animateGifOnLabel(gifFrames: [UIImage]) {
        // Create a UIImageView that will overlay the label
        let imageView = UIImageView()
        imageView.frame = emojiLabel.frame // Set the frame of the image view to match the label
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        // Set animation images and start animation
        imageView.animationImages = gifFrames
        imageView.animationDuration = 1.0 // Adjust this based on the GIF speed
        imageView.animationRepeatCount = 1 // Set to 0 for infinite loop
        emojiLabel.text = ""
        imageView.startAnimating()
        
        // Optionally hide the original label while the GIF is playing
       
        self.emojiLabel.text = "👍"
        // Show the label again after animation finishes
        DispatchQueue.main.asyncAfter(deadline: .now() + imageView.animationDuration) {
            imageView.removeFromSuperview() // Remove image view after the animation
//            self.emojiLabel.text = "👍" // Show the label again
        }
    }
    
}
