//
//  GameViewController.swift
//  Bowling
//
//  Created by Víctor Jiménez on 18/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gameCollectionView: UICollectionView!
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    let presenter = GamePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bowling"
        
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        
        gameResultLabel.isHidden = true
    }

    @IBAction func didTapSubmitButton(_ sender: Any) {
        for index in 0...9 {
            let indexPath = IndexPath(row: index, section: 0)
            guard let cell = gameCollectionView.cellForItem(at: indexPath) as? GameCollectionViewCell else {
                return
            }
            
            guard let firstThrow = Int(cell.firstThrow.text ?? "") else {
                return
            }
            
            guard let secondThrow = Int(cell.secondThrow.text ?? "") else {
                presenter.frame(pins: firstThrow)
                continue
            }
            
            presenter.frame(pins: firstThrow)
            presenter.frame(pins: secondThrow)
        }
        
        gameResultLabel.text = "\(presenter.score())"
        gameResultLabel.isHidden = false
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        cell.identifierLabel.text = "\(indexPath.row+1)"
        
        return cell
    }
}

