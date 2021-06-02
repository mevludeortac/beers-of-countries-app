//
//  imageViewController.swift
//  BeerOfCountry
//
//  Created by MEWO on 2.06.2021.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    var selectedBeerName = ""
    var selectedBeerImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        beerNameLabel.text = selectedBeerName
        beerImageView.image = selectedBeerImage
    }
    


}
