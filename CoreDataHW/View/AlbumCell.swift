//
//  TableViewCell.swift
//  CoreDataHW
//
//  Created by Field Employee on 11/4/20.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var favSwitch: UISwitch!
    var isFav: Bool = false
    var imageUrl: String?
    var albumName: String?
    var artistName: String?
    var releaseDate: String?
    var songName: String?
    
    
    
    @IBAction func onFavSwitch(_ sender: Any){
        
        self.isFav.toggle()
        //onFavoritePress?()
        if isFav {
            self.favSwitch.setOn(_: false, animated: true)
        } else {
            self.favSwitch.setOn(_: true, animated: false)
        }
        
        let albumTranslate = AlbumJSONtoCD()
        albumTranslate.albumLabel = albumName ?? ""
        albumTranslate.albumURL = imageUrl ?? ""
        albumTranslate.artistName = artistName ?? ""
        albumTranslate.releaseDate = releaseDate ?? ""
        albumTranslate.songLabel = songName ?? ""
        albumTranslate.isFavorite = isFav ?? false
        
        
        ViewModel.shared.save(toSave: albumTranslate)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
