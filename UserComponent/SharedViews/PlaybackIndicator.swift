//
//  PlaybackIndicator.swift
//  UserComponent
//
//  Created by MohamedNouri on 02/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class PlaybackIndicator: UIView {
    
    
    
    
    // label for the live Indicator
    let livelable : UILabel =
    {
        let livelable = UILabel()
        livelable.text = "Live"
        livelable.textColor = .orangeC
        livelable.translatesAutoresizingMaskIntoConstraints = false
        livelable.font = .systemFont(ofSize: 10, weight: .light)
        return livelable
    }()
    
    
    //Indicator Custom View 

   let  Indicator : IndicatorAnimator =
    {
        let indicator = IndicatorAnimator()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    
    
    
    
    func startOscillation() {
     Indicator.startOscillation()
    isHidden = false

    }
    
    func stopOscillation() {
     Indicator.stopOscillation()
     isHidden = true
    }

    
    
    
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

       
        
        // auto Layout Setting
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
    
    
    
 
    
}
