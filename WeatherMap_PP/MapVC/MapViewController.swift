//
//  ViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
//

import UIKit

class MapViewController: UIViewController {

    // положение FloatingVC
    enum CardState{
        case expanded // расширеный
        case collapsed // сжатый
    }
    
    @IBOutlet weak var testLabel: UILabel!
    
    var floatingViewController : FloatingViewController!
   // var networking: Networking?
    var floatingViewController2: FloatingViewController?
    
    let cardHeight: CGFloat = 500
    let cardHandleAreaHeight: CGFloat = 65
    
    var cardVisible = false
    var nextState: CardState{
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
        
    }
    
    // скрытие клавиатуры тапнув на любой объект  (! ДОДЕЛАТЬ ! После закрытия Вью нужно тапать 2 раза)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.view.endEditing(true) {
            UIView.animate(withDuration: 0.5) {
                self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight + 15
            }
        }
    }
    
    func setupCard() {
        floatingViewController = FloatingViewController(nibName: "FloatingViewController", bundle: nil)
        self.addChild(floatingViewController)
        self.view.addSubview(floatingViewController.view)
        
        floatingViewController.view.frame = CGRect(x: 0,
                                                   y: self.view.frame.height - cardHandleAreaHeight + 15,
                                                   width: self.view.bounds.width,
                                                   height: cardHeight)
        floatingViewController.view.clipsToBounds = true
        
        // Gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(MapViewController.handleCardTap(recognizer:)))
        floatingViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func handleCardTap(recognizer: UITapGestureRecognizer){
        switch recognizer.state{
        case .ended:
            animateTransitionIfNeedet(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    func animateTransitionIfNeedet(state: CardState, duration: TimeInterval) {
        if  runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight + 100
                case .collapsed:
                    self.floatingViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight + 15
                }
        }
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            self.runningAnimations.append(frameAnimator)
        }
    }

}



