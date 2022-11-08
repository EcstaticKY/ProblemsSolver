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
        
        let roundedView = UIView()
        roundedView.backgroundColor = .blue
        view.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            roundedView.heightAnchor.constraint(equalToConstant: 100),
            roundedView.widthAnchor.constraint(equalTo: roundedView.heightAnchor)
        ])
        
        roundedView.layer.masksToBounds = true
        roundedView.layer.cornerRadius = 4
    }
}

