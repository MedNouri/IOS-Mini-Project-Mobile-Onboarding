//
//  IndicatorAnimator.swift
//  UserComponent
//
//  Created by MohamedNouri on 02/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class IndicatorAnimator: UIView {

    
    
    
    // Indicator Settigns
    private let kBarCount = 4
    private let kBarWidth:CGFloat = 2.0
    private let kBarIdleHeight:CGFloat = 3.0
    private let kHorizontalBarSpacing:CGFloat = 1.4
    private let kRetinaHorizontalBarSpacing:CGFloat = 1.5
    private let kBarMinPeakHeight:CGFloat = 6.0
    private let kBarMaxPeakHeight:CGFloat = 8.0
    private let kMinBaseOscillationPeriod = CFTimeInterval(0.6)
    private let kMaxBaseOscillationPeriod = CFTimeInterval(0.8)
    private let kOscillationAnimationKey:String = "oscillation"
    private let kDecayDuration = CFTimeInterval(0.3)
   
    
    var barLayers = [CALayer]()
    var hasInstalledConstraints: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        prepareBarLayers()
        tintColorDidChange()
        setNeedsUpdateConstraints()
     
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func prepareBarLayers() {
        var xOffset:CGFloat = 0.0
        
        for i in 1...kBarCount {
            let newLayer = createBarLayerWithXOffset(xOffset, layerIndex: i)
            barLayers.append(newLayer)
            layer.addSublayer(newLayer)
            xOffset = newLayer.frame.maxX + horizontalBarSpacing()
        }
    }
    
    private func createBarLayerWithXOffset(_ xOffset: CGFloat, layerIndex: Int) -> CALayer {
        let layer: CALayer = CALayer()
        layer.anchorPoint = CGPoint(x: 0.0, y: 1.0) // At the bottom-left corner
        layer.position = CGPoint(x: xOffset, y: kBarMaxPeakHeight) // In superview's coordinate
        layer.bounds = CGRect(x: 0.0, y: 0.0, width: kBarWidth, height: (CGFloat(layerIndex) * kBarMaxPeakHeight/CGFloat(kBarCount))) // In its own coordinate }
        return layer
    }
    
    private func horizontalBarSpacing() -> CGFloat {
        if UIScreen.main.scale == 2.0 {
            return kRetinaHorizontalBarSpacing
        } else {
            return kHorizontalBarSpacing
        }
    }
    
    override func tintColorDidChange() {
        for layer in barLayers{
            layer.backgroundColor = UIColor.orangeC?.cgColor
        }
    }
    
    override var intrinsicContentSize : CGSize {
        var unionFrame:CGRect = CGRect.zero
        
        for layer in barLayers {
            unionFrame = unionFrame.union(layer.frame)
        }
        
        return unionFrame.size;
    }
    
    override func updateConstraints() {
        if !hasInstalledConstraints {
            let size = intrinsicContentSize
            addConstraint(NSLayoutConstraint(item: self,attribute: .width,relatedBy: .equal, toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,constant: size.width));
            
            addConstraint(NSLayoutConstraint(item: self, attribute: .height,relatedBy: .equal, toItem: nil,attribute: .notAnAttribute, multiplier: 0.0,constant: size.height));
            hasInstalledConstraints = true
        }
        super.updateConstraints()
    }
    
    func startOscillation() {
        let basePeriod = kMinBaseOscillationPeriod + (drand48() * (kMaxBaseOscillationPeriod - kMinBaseOscillationPeriod))
        
        for layer in barLayers {
            startOscillatingBarLayer(layer, basePeriod: basePeriod)
        }
    }
    
    func stopOscillation() {
        for layer in barLayers {
            layer.removeAnimation(forKey: kOscillationAnimationKey)
        }
    }
    
    func isOscillating() -> Bool {
        if let _ = barLayers.first?.animation(forKey: kOscillationAnimationKey) {
            return true
        } else {
            return false
        }
    }
    
  
    
    private func startOscillatingBarLayer(_ layer: CALayer, basePeriod: CFTimeInterval) {
        // arc4random_uniform() will return a uniformly distributed random number **less** upper_bound.
        let peakHeight: CGFloat = kBarMinPeakHeight + CGFloat(arc4random_uniform(UInt32(kBarMaxPeakHeight - kBarMinPeakHeight + 1)))
        
        var fromBouns = layer.bounds;
        fromBouns.size.height = kBarIdleHeight;
        
        var toBounds: CGRect = layer.bounds
        toBounds.size.height = peakHeight
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "bounds")
        animation.fromValue = NSValue(cgRect:fromBouns)
        animation.toValue = NSValue(cgRect:toBounds)
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.duration = TimeInterval((CGFloat(basePeriod) / 2) * (kBarMaxPeakHeight / peakHeight))
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeIn)
        
        layer.add(animation, forKey: kOscillationAnimationKey)
    }
    
 

 
    
}
