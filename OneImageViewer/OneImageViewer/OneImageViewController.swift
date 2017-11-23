//
//  OneImageViewController.swift
//  OneImageViewer
//
//  Created by 典萱 高 on 2017/11/23.
//  Copyright © 2017年 littleweh. All rights reserved.
//

import UIKit

class OneImageViewController: UIViewController {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var bottomView: UIView!
    var pickAnImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ToDo: initial UIScrollView with frame
//        scrollView = UIScrollView()
//        imageView = UIImageView(image: UIImage(named: "icon_photo"))
        
        
        bottomView = UIView()
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 77)
        bottomView.frame = rect
        bottomView.backgroundColor = UIColor(
            red: 249.0/255.0,
            green: 223.0/255.0,
            blue: 23.0/255.0,
            alpha: 1.0
        )
        self.view.addSubview(bottomView)
        
        pickAnImageButton = UIButton()
        pickAnImageButton.frame = CGRect(x: 0, y: 0, width: 180, height: 44)
        pickAnImageButton.backgroundColor = UIColor(
            red: 43.0/255.0,
            green: 43.0/255.0,
            blue: 43.0/255.0,
            alpha: 1.0
        )
        pickAnImageButton.setTitle("Pick an Image", for: .normal)
        pickAnImageButton.setTitleColor(.white, for: .normal)
        pickAnImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        pickAnImageButton.contentHorizontalAlignment = .left
        self.bottomView.addSubview(pickAnImageButton)
        
        
        
//        setUpScrollView()
//        setUpImageView()
//        setUpBottomView()
//        setUpPickAnImageButton()
    } // viewDidLoad
    
    func setUpBottomView() {
        
        
    } //setUpBottomView

    func setUpPickAnImageButton() {
    } //setUpPickAnImageButton

    func setUpScrollView() {
    } //setUpScrollView


    func setUpImageView() {
    } //setUpImageView
    
    


} // class OneImageViewController
