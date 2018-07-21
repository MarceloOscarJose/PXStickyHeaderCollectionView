//
//  DataCellModel.swift
//  PXStickyHeaderCollectionView_Example
//
//  Created by Marcelo Oscar José on 21/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class DataCellModel {

    var id: Int = 0
    var title: String = ""
    var image: String = ""

    init() {
        self.id = 1
        self.title = ""
        self.image = ""
    }

    init(id: Int, title: String, image: String) {
        self.id = id
        self.title = title
        self.image = image
    }

    public static func getData(total: Int) -> [DataCellModel] {

        let cellData: [DataCellModel] = [
            DataCellModel(id: 1, title: "Linkedin", image: "icon_linkedin"),
            DataCellModel(id: 2, title: "Twitter", image: "icon_twitter"),
            DataCellModel(id: 3, title: "Vimeo", image: "icon_vimeo"),
            DataCellModel(id: 4, title: "wordpress", image: "icon_wordpress"),
            DataCellModel(id: 5, title: "Yahoo", image: "icon_yahoo"),
            DataCellModel(id: 6, title: "Youtube", image: "icon_you_tube"),
            DataCellModel(id: 7, title: "Facebook", image: "icon_facebook"),
            DataCellModel(id: 8, title: "Flickr", image: "icon_flickr"),
            DataCellModel(id: 9, title: "Furl", image: "icon_furl"),
            DataCellModel(id: 10, title: "Google", image: "icon_google"),
            DataCellModel(id: 11, title: "My space", image: "icon_my_space"),
            DataCellModel(id: 12, title: "Picasa", image: "icon_picasa"),
            DataCellModel(id: 13, title: "Reddit", image: "icon_reddit"),
            DataCellModel(id: 14, title: "Skype", image: "icon_skype"),
            DataCellModel(id: 15, title: "Technorati", image: "icon_technorati"),
            DataCellModel(id: 16, title: "Tumblr", image: "icon_tumblr")
        ]

        return Array(cellData.prefix(total))
    }
}
