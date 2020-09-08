//
//  PlaybackIndicator.swift
//  UserComponent
//
//  Created by Startdevelopment on 02/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class PlaybackIndicator: UIView {
    
    
    
    
    
    let livelable : UILabel =
    {
        let livelable = UILabel()
        livelable.text = "Live"
        livelable.textColor = .orangeC
        livelable.font = .systemFont(ofSize: 10, weight: .light)
        return livelable
    }()
    
    
    
    let Indicator : IndicatorAnimator =
    {
        let indicator = IndicatorAnimator()
        
        return indicator
    }()
    
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
        
        
        backgroundColor = .clear
        layer.borderColor = UIColor.orangeC?.cgColor
        layer.borderWidth = 1.5
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(livelable)
        addSubview(Indicator)
        livelable.translatesAutoresizingMaskIntoConstraints = false
        Indicator.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 45),
            heightAnchor.constraint(equalToConstant: 15),
            livelable.centerYAnchor.constraint(equalTo:  centerYAnchor),
            livelable.trailingAnchor.constraint(equalTo:  trailingAnchor, constant:  -5),
            Indicator.centerYAnchor.constraint(equalTo:  centerYAnchor),
            Indicator.leadingAnchor.constraint(equalTo:  leadingAnchor, constant:  5),
            
            
            
            ]
        )
    }
    
    
    
    
    //in playground we should have a red rectangle
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
