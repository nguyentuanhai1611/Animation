//
//  SpeechView.swift
//  Anim
//
//  Created by Anonymos on 25/06/2022.
//

import Foundation
import UIKit

final class SpeechView: UIView {

    enum SpeechType {
        case waiting
        case listening
        case preparing
        case speaking
        
        var animation: Animation {
            switch self {
            case .waiting:
                return BallPulseAnimation()
            case .listening:
                return BallPulseAnimation()
            case .preparing:
                return BallScaleAnimation()
            case .speaking:
                return BallScaleAnimation()
            }
        }
    }
    
    override var bounds: CGRect {
        didSet {
            // setup the animation again for the new bounds
            if oldValue != bounds && isAnimating {
                setupAnimation()
            }
        }
    }
    
    public var type: SpeechType = .waiting
    public var padding: CGFloat = 0
    public var color: UIColor = .yellow
    public var repeatCount: Float = HUGE
    
    public var backgroundImage: UIImage?
    public var avatarImage: UIImage?
    
    private var isAnimating: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpeechView {
    public final func startAnimating() {
        guard !isAnimating else {
            return
        }
        isHidden = false
        isAnimating = true
        layer.speed = 1
        setupAnimation()
    }
    
    public final func stopAnimating() {
        guard isAnimating else {
            return
        }
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }
}

extension SpeechView {
    private func setupAnimation() {
        let animation = type.animation
        var rect = frame.inset(by: UIEdgeInsets(top: padding,
                                                left: padding,
                                                bottom: padding,
                                                right: padding))
        let minEdge = min(rect.width, rect.height)
        layer.sublayers = nil
        layer.contents = backgroundImage?.cgImage
        rect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: layer, size: rect.size, color: color, repeatCount: repeatCount)
        
        if let image = avatarImage {
            let imageView = UIImageView(image: image)
            imageView.frame.size = rect.size
            addSubview(imageView)
        }
    }
}
