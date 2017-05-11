//
//  ViewController.swift
//  UiDeviceTest
//
//  Created by Jack Ngai on 4/5/17.
//  Copyright © 2017 Jack Ngai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var legalButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //print(UIDevice.current.deviceType!)
        
        print(UIScreen.main.bounds.height)
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
        
        legalButton.setTitle("Legal", for: .normal)
        legalButton.backgroundColor = .red
        legalButton.tintColor = .black
        
        view.addSubview(legalButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIDevice {
    enum DeviceType {
        case iPhone35
        case iPhone40
        case iPhone47
        case iPhone55
        case iPad
        case TV
        
        var isPhone: Bool {
            return [ .iPhone35, .iPhone40, .iPhone47, .iPhone55 ].contains(self)
        }
    }
    
    var deviceType: DeviceType? {
        switch UIDevice.current.userInterfaceIdiom {
        case .tv:
            return .TV
            
        case .pad:
            return .iPad
            
        case .phone:
            let screenSize = UIScreen.main.bounds.size
            let height = max(screenSize.width, screenSize.height)
            
            switch height {
            case 480:
                return .iPhone35
            case 568:
                return .iPhone40
            case 667:
                return .iPhone47
            case 736:
                return .iPhone55
            default:
                return nil
            }
            
        case .unspecified:
            return nil
            
        default:
            return nil
        }
    }
}
