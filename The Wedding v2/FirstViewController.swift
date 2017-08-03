//
//  FirstViewController.swift
//  The Wedding v2
//
//  Created by Jacqueline DesMarais on 2/4/17.
//  Copyright © 2017 Jacque DesMarais. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            }
    @IBAction func didTapWebsite(_ sender: Any) {
        if let url = NSURL(string: "http://www.lindseyandjacque.com"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

