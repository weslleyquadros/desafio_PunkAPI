//
//  BeersViewController.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit
import Lottie
import RxSwift

class BeersViewController : UIViewController {
    
    private var components : BeersComponents!
    private var contentScreen : BeersScreen!
    private var disposeBag = DisposeBag()
    
    var countdownLoading: Timer!
    var totalTime = 2
    
    
    //Lottie
    let animationView = AnimationView()
    var layerBg : CAGradientLayer = {
                   let bg = CAGradientLayer()
      //             bg.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.7137254902, blue: 0.2862745098, alpha: 1)
                   bg.colors = [ #colorLiteral(red: 0.3105362653, green: 0.7345891494, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2010839403, green: 0.4681100742, blue: 1, alpha: 1).cgColor]
      //             bg.startPoint = CGPoint.init(x: 0.5, y: 0)
      //             bg.endPoint = CGPoint.init(x: 0.5, y: 1)
              
              
                   return bg
        }()
    
    
    //    View Model - Conexão com a API
    var viewModel = BeersViewModel() {
        willSet {
            viewModel.viewDelegate = nil
        }
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpContentView()
        navigationController?.isNavigationBarHidden = true
        
        viewModel = BeersViewModel()
        
        startScreen()
        
        viewModel.getBeers()
        // Dispensar o teclado
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:))))
    }
    
   
   
    private func setUpContentView() {
           
           components = BeersComponents()
           contentScreen = BeersScreen(components: components, frame: view.frame)
           view.addSubview(contentScreen)
           contentScreen.translatesAutoresizingMaskIntoConstraints = false
           
           
           var initialConstraints = [NSLayoutConstraint]()
           initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-|",
                                                                options: NSLayoutConstraint.FormatOptions(),
                                                                metrics: nil,
                                                                views: ["v0" : contentScreen!])
           
           initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]-0-|",
                                                                options: NSLayoutConstraint.FormatOptions(),
                                                                metrics: nil,
                                                                views: ["v0" : contentScreen!])
//           if UIDevice().userInterfaceIdiom == .phone {
//               switch UIScreen.main.nativeBounds.height {
//               case 1136:
//                   iphone5s = true
//               case 1334:
//                   break
//               case 1920, 2208:
//                   break
//               case 2436:
//                   iphoneX = true
//
//               case 2688:
//                   iphoneX = true
//                   iphoneB = true
//
//               case 1792:
//                   iphoneX = true
//
//               default:
//                   break
//               }
//           }
           NSLayoutConstraint.activate(initialConstraints)
       }
    
            func startScreen() {
    //            viewModel.confirmCodeEmail(code: components.fieldEmail.text!)
                layerBg.frame = (view.bounds)
                 view.layer.addSublayer(layerBg)
                
                animationView.animation = Animation.named("splashBeers")
                     
                view.addSubview(animationView)
                     
                     animationView.translatesAutoresizingMaskIntoConstraints = false
                     
                     
                animationView.centerYAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.centerYAnchor).isActive = true
                     
                animationView.centerXAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.centerXAnchor).isActive = true
                     
                     
                     
                     animationView.heightAnchor.constraint(equalToConstant: 230).isActive = true
                     animationView.widthAnchor.constraint(equalToConstant: 230).isActive = true
                     
                     animationView.loopMode = LottieLoopMode.loop
                     animationView.play()
                     
                
                countdownLoading = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLoading), userInfo: nil, repeats: true)
                
            }
            
            @objc func updateLoading() {
            
                
                if totalTime != 0 {
                    totalTime -= 1
                   
                } else {
                    endLoading()
                    
                }
            }
            
            func endLoading() {
                countdownLoading.invalidate()
                animationView.alpha = 0
               setUpContentView()
                
            UIView.animate(withDuration: 1.0) {
                //            self.layerBg.isHidden = true
            self.setUpContentView()
                
                        }
                
                
                totalTime = 2
                
            }
}

extension BeersViewController : BeersViewModelDelegate {
    func isSubmitStatus(status: Bool) {
        
    }
    
    func errorMessageDidChange(message: String) {
    let alert = UIAlertController(title: "Error", message: "Ops, algo deu errado!! :/", preferredStyle: .alert)

//    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))

    self.present(alert, animated: true)
    }
    
    func signupSuccess(title: String, message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    



}
