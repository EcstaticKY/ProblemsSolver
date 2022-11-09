//
//  ViewController.swift
//  iOSResearch
//
//  Created by zky on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let roundedView = UIView()
        roundedView.backgroundColor = .blue
        view.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView.layer.masksToBounds = true
        roundedView.layer.cornerRadius = 4
        
        let roundedView2 = UIView()
        roundedView2.backgroundColor = .blue
        view.addSubview(roundedView2)
        roundedView2.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView2.layer.masksToBounds = true
        roundedView2.layer.cornerRadius = 4
        
        let roundedImageView = UIImageView(image: UIImage(named: "einstein"))
        
        roundedImageView.backgroundColor = .blue
//        view.addSubview(roundedImageView)
        roundedView2.addSubview(roundedImageView)
        roundedImageView.translatesAutoresizingMaskIntoConstraints = false
        
//        roundedImageView.layer.masksToBounds = true
//        roundedImageView.layer.cornerRadius = 4
        
        NSLayoutConstraint.activate([
            roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            roundedView.heightAnchor.constraint(equalToConstant: 100),
            roundedView.widthAnchor.constraint(equalTo: roundedView.heightAnchor),
            
            roundedView2.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 10),
            roundedView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundedView2.heightAnchor.constraint(equalTo: roundedView.heightAnchor),
            roundedView2.widthAnchor.constraint(equalTo: roundedView.widthAnchor),
            
//            roundedImageView.topAnchor.constraint(equalTo: roundedView2.bottomAnchor, constant: 10),
//            roundedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            roundedImageView.heightAnchor.constraint(equalTo: roundedView.heightAnchor),
//            roundedImageView.widthAnchor.constraint(equalTo: roundedView.widthAnchor),
            
            roundedImageView.topAnchor.constraint(equalTo: roundedView2.topAnchor),
            roundedImageView.bottomAnchor.constraint(equalTo: roundedView2.bottomAnchor),
            roundedImageView.leadingAnchor.constraint(equalTo: roundedView2.leadingAnchor),
            roundedImageView.trailingAnchor.constraint(equalTo: roundedView2.trailingAnchor),
        ])
    }
}

