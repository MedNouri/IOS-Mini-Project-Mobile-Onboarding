//
//  UserComponent.swift
//  UserComponent
//
//  Created by MohamedNouri on 06/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
class UserComponent: UICollectionViewCell {
  static let reuseIdentifier = "usercomponent-reuse-identifier"

  
    
    
    // To be removed
    
 
    var data:UserDetailItem? {
    
    didSet {
        
        
        guard let data = data else {return}
        
        artistName.text = data.artistName.displayNicely
        location.text = data.location.displayNicely
        followers.text = "\(data.follwersNumber) Followers"
        
        checkIfCurrentlyLive(data)
        setFollowingButton(data.followed )
        downloadImage(imageurl: data.photoURL)
        
        
        
        
        }
    
    
    }
    func downloadImage(from url: URL , success:@escaping((_ image:UIImage)->()),failure:@escaping ((_ msg:String)->())){
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                 return
            }
              DispatchQueue.main.async() {
                 if let _img = UIImage(data: data){
                      success(_img)
                }
            }
        }
    }
    
   
    
    private func downloadImage(imageurl:String){
    if let url = URL(string: imageurl) {
                              self.downloadImage(from:url , success: { (image) in
                                self.userImage.image = image

                              }, failure: { (failureReason) in
                                  print(failureReason)
                              })
                          }
        
        
    }
    
    
    
    fileprivate func checkIfCurrentlyLive(_ data: UserDetailItem) {
         if (data.currentlyLive){
             playingLiveIcon.isHidden = false
             playingLiveIcon.startOscillation()
         }
     }
     
    
    
    private func setFollowingButton(_ followed:Bool){
    if followed {
            followButton.backgroundColor = .ButtonSelectedColor
            followButton.setTitle("Following", for: .normal)
        }
        
    }
    
    
    
    
    
       func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
       }
    
  let rootBackground : UIView = {
       let root = UIView()
       root.translatesAutoresizingMaskIntoConstraints = false
       root.backgroundColor = .systemBackground
       return root
   }()
   
   
   
   let userImage : UIImageView = {
       let userimage = UIImageView()
       userimage.translatesAutoresizingMaskIntoConstraints = false
       userimage.backgroundColor = UIColor.darkGray
       userimage.image = #imageLiteral(resourceName: "placeholder-user")
       userimage.contentMode = .scaleAspectFill
       userimage.clipsToBounds = true
       userimage.layer.borderWidth = 1.0
       userimage.layer.borderColor = UIColor.buttonC?.withAlphaComponent(0.1).cgColor
       userimage.layer.cornerRadius = 40

       return userimage
   }()
   
   
   let artistName : UILabel = {
       let artistName = UILabel()
       artistName.translatesAutoresizingMaskIntoConstraints = false
       artistName.text = "Artist Name"
       artistName.font = .systemFont(ofSize: 14, weight: .regular)
       artistName.numberOfLines = 1
       return artistName
   }()
   
   
   
   let location : UILabel = {
       let location = UILabel()
       location.translatesAutoresizingMaskIntoConstraints = false
       location.text = "Location"
       location.numberOfLines = 1
       location.font = .systemFont(ofSize: 12, weight: .regular)

       location.textColor = .labelGrayColor

       return location
   }()
   
   lazy var playingLiveIcon : PlaybackIndicator = {
       let playingLiveIcon = PlaybackIndicator()
       playingLiveIcon.isHidden = true 
       playingLiveIcon.translatesAutoresizingMaskIntoConstraints = false
       return playingLiveIcon
   }()
   
   let locationStackView : UIStackView = {
       let locationStackView = UIStackView()
       locationStackView.translatesAutoresizingMaskIntoConstraints = false
       locationStackView.axis = .horizontal
       locationStackView.spacing = 4
        locationStackView.distribution = .fillProportionally
        locationStackView.alignment = .fill
       return locationStackView
   }()
   
   
   let followers : UILabel = {
       let followers = UILabel()
       followers.translatesAutoresizingMaskIntoConstraints = false
       followers.text = "230 Followers"
        followers.numberOfLines = 1
       followers.textColor = .labelGrayColor
       followers.font = .systemFont(ofSize: 12, weight: .light)

       return followers
   }()
   
   let followersIcon : UIImageView = {
       let followersIcon = UIImageView()
       followersIcon.translatesAutoresizingMaskIntoConstraints = false
    followersIcon.image = UIImage(systemName: "person.2.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .medium , scale: .default))
        followersIcon.tintColor = .labelGrayColor
 
       return followersIcon
   }()
   
   let followersStackView : UIStackView = {
       let followersStackView = UIStackView()
       followersStackView.translatesAutoresizingMaskIntoConstraints = false
       followersStackView.axis = .horizontal
       followersStackView.spacing = 4
       return followersStackView
   }()
   
   
   
   
   let followButton : UIButton = {
       let followButton = UIButton()
       followButton.translatesAutoresizingMaskIntoConstraints = false
       followButton.setTitle("Follow", for: .normal)
       followButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
       followButton.setTitleColor(.ButtontextColor, for: .normal)
      
       followButton.backgroundColor = .buttonC
        followButton.layer.cornerRadius = 5
       return followButton
   }()
   
   
   
   let rootStackView : UIStackView = {
       let rootStackView = UIStackView()
       rootStackView.translatesAutoresizingMaskIntoConstraints = false
       rootStackView.distribution = .fillProportionally
       rootStackView.axis = .vertical
       rootStackView.alignment = .leading
       rootStackView.spacing = 5
       return rootStackView
   }()
   
   
   
   
   

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}




extension UserComponent {
  func configure() {
    backgroundColor = .systemBackground

 
 addSubview(rootBackground)
 rootBackground.addSubview(userImage)
 
 rootBackground.addSubview(rootStackView)
 rootStackView.addArrangedSubview(artistName)
 rootStackView.addArrangedSubview(locationStackView)
 
 locationStackView.addArrangedSubview(location)
 locationStackView.addArrangedSubview(playingLiveIcon)
 
 rootStackView.addArrangedSubview(followersStackView)
 followersStackView.addArrangedSubview(followersIcon)
 followersStackView.addArrangedSubview(followers)
 
 
 
 rootBackground.addSubview(followButton)
    
    
    // Setting Auto Layout
    NSLayoutConstraint.activate([
       // rootBackground
         rootBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        rootBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        rootBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0),
        rootBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        // rootStackView
        rootStackView.centerYAnchor.constraint(equalTo: rootBackground.centerYAnchor),
        rootStackView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
        rootStackView.trailingAnchor.constraint(greaterThanOrEqualTo: userImage.leadingAnchor, constant: 16),
        
        // followButton
        followButton.centerYAnchor.constraint(equalTo: rootBackground.centerYAnchor),
        followButton.trailingAnchor.constraint(equalTo: rootBackground.trailingAnchor, constant: -16),
        followButton.widthAnchor.constraint(equalToConstant: 85),
        followButton.heightAnchor.constraint(equalToConstant: 35),
        // userImage
        userImage.centerYAnchor.constraint(equalTo: rootBackground.centerYAnchor),
        userImage.leadingAnchor.constraint(equalTo: rootBackground.leadingAnchor, constant: 16),
        userImage.widthAnchor.constraint(equalToConstant: 80),
        userImage.heightAnchor.constraint(equalToConstant: 80),
        
           
    ])
    
   
    
    
  }
  
}


 
