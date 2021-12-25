//
//  FloatingCard.swift
//  WeatherMap_PP
//
//  Created by Oleg on 06.11.2021.
//

import Foundation
import UIKit

var cardVisible = false

extension MapViewController {
    
    // положение FloatingVC
    enum CardState{
        case expanded // расширеный
        case collapsed // сжатый
    }
    
    var nextState: CardState{
        return cardVisible ? .collapsed : .expanded
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.view.endEditing(true) {
            UIView.animate(withDuration: 0.5) {
                self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.floatingViewController.cardHandleAreaHeight + 15
            }
        }
    }
    
    // Create Floating View Controller
    func setupCard() {
        floatingViewController = FloatingViewController(nibName: "FloatingViewController", bundle: nil)
        self.addChild(floatingViewController)
        self.view.addSubview(floatingViewController.view)
        
        floatingViewController.view.frame = CGRect(x: 0,
                                                   y: self.view.frame.height - floatingViewController.cardHandleAreaHeight + 15,
                                                   width: self.view.bounds.width,
                                                   height: floatingViewController.cardHeight)
        floatingViewController.view.clipsToBounds = true
        floatingViewController.view.layer.cornerRadius = 20
        
        // Gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(MapViewController.handleCardTap(recognizer:)))
        floatingViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Animation
    @objc
    func handleCardTap(recognizer: UITapGestureRecognizer){
        switch recognizer.state{
        case .ended:
            animateTransitionIfNeedet(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    // Появление/скрытие FloatingVC
    func animateTransitionIfNeedet(state: CardState, duration: TimeInterval) {
        if  floatingViewController.runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                
                switch state {
                case .expanded:
                    self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.floatingViewController.cardHeight + 130
                case .collapsed:
                    self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.floatingViewController.cardHandleAreaHeight + 15
                }
            }
            frameAnimator.addCompletion { _ in
                cardVisible = !cardVisible
                self.floatingViewController.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            floatingViewController.runningAnimations.append(frameAnimator)
        }
    }
    
}
