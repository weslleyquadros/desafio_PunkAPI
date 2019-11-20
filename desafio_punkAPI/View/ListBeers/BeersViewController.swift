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

class BeersViewController : UIViewController, UITableViewDelegate, CAAnimationDelegate {
    
    private var components : BeersComponents!
    private var contentScreen : BeersScreen!
    private var disposeBag = DisposeBag()
    
    
    var countdownLoading: Timer!
    var totalTime = 2
    
    var filterdTerms : [BeersClass] = [BeersClass]()
    
    var listBeers : [BeersClass] = [BeersClass]()
    
    //Lottie
    let animationView = AnimationView()
    var layerBg : CAGradientLayer = {
        let bg = CAGradientLayer()
        bg.colors = [ #colorLiteral(red: 0.3105362653, green: 0.7345891494, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2010839403, green: 0.4681100742, blue: 1, alpha: 1).cgColor]
    
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
        
//        viewModel.getBeers()
        
        appendList()
        
        
                             
        
       
        
       
        // Dispensar o teclado
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:))))
    }
    
     func appendList() {
       
          listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
          listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Lora", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers") , name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
        listBeers.append(BeersClass(image: #imageLiteral(resourceName: "beers"), name: "Skol", abv: "4,5%"))
   
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
              
            UIView.animate(withDuration: 1.0) {
                //            self.layerBg.isHidden = true
            self.setUpContentView()
                
                //setUpContentView()
                self.components.tableViewBeers.register(ListBeersCell.self, forCellReuseIdentifier: "listBeersCell")
                       
                self.components.tableViewBeers.dataSource = self
                self.components.tableViewBeers.delegate = self
                
                
            }
                components.searchBeersTextField.addTarget(self, action: #selector(seachInRequest), for: .editingChanged)
                components.searchBeersTextField.endEditing(true)
                
                
                totalTime = 2
                
            }
    
    
    @objc func seachInRequest(seach: UITextField){
           let seachText = seach.text ?? ""
           filterContentForSearchText(searchText: seachText)
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


extension BeersViewController : UITableViewDataSource {

    func filterContentForSearchText(searchText: String) {
        filterdTerms.removeAll()
        UIView.animate(withDuration: 0.4) {
//            self.components.imageEmpty.alpha = 0
//            self.components.mensageEmptyLabel.alpha = 0
//            self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        }
        for i in listBeers {
           if i.name.localizedCaseInsensitiveContains(searchText){
                filterdTerms.append(i)
                components.tableViewBeers.reloadData()
            }
            
        }
        if filterdTerms.count == 0 {
           
            UIView.animate(withDuration: 0.4) {
//                self.components.imageEmpty.alpha = 1
//                self.components.mensageEmptyLabel.alpha = 1
//                self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
            }
            filterdTerms.removeAll()
            components.tableViewBeers.reloadData()
        }
        
        if components.searchBeersTextField.text == "" {
            filterdTerms.removeAll()
            filterdTerms = listBeers
//            self.components.imageEmpty.alpha = 0
//            self.components.mensageEmptyLabel.alpha = 0
//               self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            components.tableViewBeers.reloadData()
        }
    
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if components.searchBeersTextField.text != ""  {
                          return filterdTerms.count
                      }
                    
                   if listBeers.count == 0 {
//                        self.components.mensageEmptyLabel.alpha = 1
//                        self.components.imageEmpty.alpha = 1
//                       self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
                   }
                   
                      return listBeers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = components.tableViewBeers.dequeueReusableCell(withIdentifier: "listBeersCell", for: indexPath) as? ListBeersCell
                
                cell?.listBeer =  listBeers[indexPath.row]
             
                
                var itemToShow = listBeers[indexPath.row]
                       if filterdTerms.count != 0 {
        //                   if seachStatus {
                               if components.searchBeersTextField.text != "" {
                                itemToShow = filterdTerms[indexPath.row]
                               }
                         //  }
                           else {
                               itemToShow = filterdTerms[indexPath.row]
                           }
                           
                       }
        //
                cell?.nameBeer.text = itemToShow.name
        
        if listBeers.count == 0 {
                        
                         UIView.animate(withDuration: 0.4) {
//                             self.components.imageEmpty.alpha = 1
//
//                             self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
                         }
                         listBeers.removeAll()
                         components.tableViewBeers.reloadData()
                     }
                     
                cell?.backgroundColor = UIColor.white
                           
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             let sizeHeight = components.tableViewBeers.frame.size.height
             var height = 0.0   //
             
                 if UIDevice().userInterfaceIdiom == .phone {
                         switch UIScreen.main.nativeBounds.height {
                         case 1136:
                             height = 0.45
                         case 1334:
                             height = 0.45
                         case 1920, 2208:
                             height = 0.40
                         case 2436:
                             height = 0.38
                         case 2688:
                          height = 0.38
                         case 1792:
                             height = 0.35
                         default:
                             print("Unknown")
                         }
                 }
             return sizeHeight * CGFloat(height)
             
         }
                    

                    
         func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                        return 3.5
         }
    
}
extension BeersViewController : UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
   
    

    
}
