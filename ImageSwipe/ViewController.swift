//
//  ViewController.swift
//  ImageSwipe
//
//  Created by Rajiv Deshmukh on 3/20/19.
//  Copyright © 2019 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let imageArray: [UIImage] = (1...5).map { UIImage(named: "image\($0)")! }
    var counter = 1
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
        setupImages(imageArray)
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
//        self.scrollToPage(page: 2, animated: true)
    }
    // must be internal or public.
    @objc func update() {
        UIView.animate(withDuration: 1.0) {
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(self.counter)
        }
        print("Done")
        if counter == imageArray.count {
            counter = 0
        } else {
            counter += 1
        }
    }
    
    func scrollToPage(page: Int, animated: Bool) {
        
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

