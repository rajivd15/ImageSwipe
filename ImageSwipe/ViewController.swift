//
//  ViewController.swift
//  ImageSwipe
//
//  Created by Rajiv Deshmukh on 3/20/19.
//  Copyright © 2019 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageArray: [UIImage] = (0...4).map { UIImage(named: "image\($0)")! }
    var counter = 0
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.scrollView)
        imageArray.append(UIImage(named: "image0")!)

        setupImages(imageArray)
        self.scrollView.delegate = self
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }

    @objc func update() {
//        UIView.animate(withDuration: 1.0) {
            print("inside animate - \(self.counter)")
            self.counter += 1
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(self.counter)
            print("animate - \(self.counter)")
//        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("inside scrolldViewDidScroll - \(counter)")
        if counter == imageArray.count {
            
//                let rect = CGRect(x: 818, y: 0, width: 0, height: 0)
//                self.scrollView.scrollRectToVisible(rect, animated: false)
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(1)
            counter = 0
            print("scroll - \(self.counter)")
        }
    }

    func setupImages(_ images: [UIImage]) {
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
            scrollView.delegate = self
        }
    }
}

