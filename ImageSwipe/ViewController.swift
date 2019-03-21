//
//  ViewController.swift
//  ImageSwipe
//
//  Created by Rajiv Deshmukh on 3/20/19.
//  Copyright © 2019 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    var imageIndex = 0
    let arrayOfImages = ["image1", "image2", "image3", "image4", "image5"]
    var counter = 1
    var timer = Timer()

    let loadingImages: [UIImage] = (1...5).map { UIImage(named: "image\($0)")! }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.imageView)
        setupConstraints()
        UIView.animate(withDuration: 1.0) {
            self.doSomeAnimation()
        }
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomeAnimation), userInfo: nil, repeats: true)
//        self.imageView.image = UIImage(named: arrayOfImages[imageIndex])
//
//        self.imageView.animationImages = loadingImages
//        self.imageView.animationDuration = 10.0
//        self.imageView.startAnimating()
        
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.imageSwipped(_:)))
//        swipeLeft.direction = .left
//        self.imageView.addGestureRecognizer(swipeLeft)
//
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.imageSwipped))
//        swipeRight.direction = .right
//        self.imageView.addGestureRecognizer(swipeRight)
        
        
    }
    
    @objc func doSomeAnimation() {
        //I have four pngs in my project, which are named frame1.png ... and so on
        
        
        if counter == 5 {
            
            counter = 1
            
        }else {
            
            counter += 1
        }
        
        self.imageView.image = UIImage(named: "image\(counter)")
    }
    
    @objc func imageSwipped(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if imageIndex < arrayOfImages.count - 1 {
                    imageIndex += 1
                    self.imageView.image = UIImage(named: arrayOfImages[imageIndex])
                }
            case UISwipeGestureRecognizer.Direction.right:
                if imageIndex > 0 {
                    imageIndex -= 1
                    self.imageView.image = UIImage(named: arrayOfImages[imageIndex])
                }
            default:
                print("I am here")
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
                                     self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0),
                                     self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
                                     self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50.0)])
    }
}

