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
        scrollView = UIScrollView()
        imageView = UIImageView(image: UIImage(named: "icon_photo"))
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 77)
        scrollView.frame = rect
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        
        
        
        
        
        
//        setUpScrollView()
//        setUpImageView()
        setUpBottomView()
        setUpPickAnImageButton()
    } // viewDidLoad
    
    func setUpBottomView() {
        let margins = self.view.layoutMarginsGuide
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 77)
        bottomView = UIView()
        bottomView.frame = rect
        bottomView.backgroundColor = UIColor(
            red: 249.0/255.0,
            green: 223.0/255.0,
            blue: 23.0/255.0,
            alpha: 1.0
        )
        self.view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0),
            bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            bottomView.heightAnchor.constraint(equalToConstant: 77),
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    } //setUpBottomView

    func setUpPickAnImageButton() {
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
        pickAnImageButton.contentHorizontalAlignment = .center

        pickAnImageButton.layer.cornerRadius = 2
        pickAnImageButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        pickAnImageButton.layer.shadowColor = UIColor(
            red: 0/255.0,
            green: 0/255.0,
            blue: 0/255.0,
            alpha: 0.25
        ).cgColor
        pickAnImageButton.layer.masksToBounds = true
        
        self.bottomView.addSubview(pickAnImageButton)
        pickAnImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickAnImageButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            pickAnImageButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            pickAnImageButton.heightAnchor.constraint(equalToConstant: bottomView.frame.size.height * 4 / 7 ),
            pickAnImageButton.widthAnchor.constraint(equalToConstant: bottomView.frame.size.width / 2)
        ])
    } //setUpPickAnImageButton

    func setUpScrollView() {
    } //setUpScrollView


    func setUpImageView() {
    } //setUpImageView
    
    


} // class OneImageViewController
