//
//  OneImageViewController.swift
//  OneImageViewer
//
//  Created by 典萱 高 on 2017/11/23.
//  Copyright © 2017年 littleweh. All rights reserved.
//

import UIKit

class OneImageViewController: UIViewController,  UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var bottomView: UIView!
    var pickAnImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(
            red: 43.0/255.0,
            green: 43.0/255.0,
            blue: 43.0/255.0,
            alpha: 1.0
        )
        
        imageView = UIImageView(image: UIImage(named: "icon_photo"))
        let templateImage = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.image = templateImage
        imageView.tintColor = .white
        
        bottomView = UIView()
        pickAnImageButton = UIButton()
        self.view.addSubview(bottomView)
        bottomView.addSubview(pickAnImageButton)
        
        setUpBottomView()
        setUpPickAnImageButton()
        
        pickAnImageButton.addTarget(self, action: #selector(importPhotoFromLibrary), for: .touchUpInside)

        scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)

        setUpScrollView()
//        setUpImageView()
        scrollView.contentSize = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height - bottomView.frame.size.height - 20
        )

        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        scrollView.delegate = self
        scrollView.maximumZoomScale = 2.0
        
    } // viewDidLoad

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    } // viewForZooming
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)

        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    } // func updateMinZoomScaleForSize

    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        let size = CGSize(
            width: view.bounds.width,
            height: view.bounds.height - 20 - bottomView.bounds.height
        )
//        print(size)
        updateMinZoomScaleForSize(size)
    } // viewWillLayoutSubviews
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize()
    }
    
    fileprivate func updateConstraintsForSize() {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ?            (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(
            top: verticalPadding,
            left: horizontalPadding,
            bottom: verticalPadding,
            right: horizontalPadding
        )
    }

    func setUpScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scrollView.widthAnchor.constraint(equalToConstant: self.view.bounds.width)
        ])
    } //setUpScrollViewConstraints
    
    func setUpImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: self.view.bounds.width)
            ])
    }

    func setUpBottomView() {
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 77)
        
        bottomView.frame = rect
        bottomView.backgroundColor = UIColor(
            red: 249.0/255.0,
            green: 223.0/255.0,
            blue: 23.0/255.0,
            alpha: 1.0
        )
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            bottomView.heightAnchor.constraint(equalToConstant: 77),
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    } //setUpBottomView
    
    func setUpPickAnImageButton() {
        
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
        
        pickAnImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickAnImageButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            pickAnImageButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            pickAnImageButton.heightAnchor.constraint(equalToConstant: bottomView.frame.size.height * 4 / 7 ),
            pickAnImageButton.widthAnchor.constraint(equalToConstant: bottomView.frame.size.width / 2)
        ])
    } //setUpPickAnImageButton

    
} // class OneImageViewController

extension OneImageViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func importPhotoFromLibrary(){
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.dismiss(animated: true, completion: nil)
        }
    }
}

