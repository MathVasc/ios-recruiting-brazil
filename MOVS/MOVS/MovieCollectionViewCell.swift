//
//  MovieCollectionViewCell.swift
//  MOVS
//
//  Created by Matheus de Vasconcelos on 15/11/18.
//  Copyright © 2018 Matheus. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, FilmCell {
    
    var film: ResponseFilm?
    
    @IBOutlet weak var outletPosterImageView: UIImageView!
    @IBOutlet weak var outletActivity: UIActivityIndicatorView!
    @IBOutlet weak var outletGradientView: UIView!
    @IBOutlet weak var outletFilmNameLabel: UILabel!
    @IBOutlet weak var outletFavoriteImageView: UIImageView!
    
    
    func setup(withFilm film: ResponseFilm){
        self.film = film
        DesignManager.gradient(toView: self.outletGradientView)
        DesignManager.applyShadow(toView: self)
        self.outletActivity.alpha = 1
        self.outletFilmNameLabel.text = film.title
        self.outletPosterImageView.getPoster(forFilm: film, andActivity: self.outletActivity)
        
        if let id = film.id {
            if CoreDataManager<Film>().exist(predicate: NSPredicate(format: "id = %@", "\(id)")){
                self.outletFavoriteImageView.tintColor = PaletColor.pink.rawValue
            }else{
                self.outletFavoriteImageView.tintColor = PaletColor.darkGray.rawValue
            }
        }
    }
}
