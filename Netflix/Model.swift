//
//  Model.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import Foundation

/*Se crea una estructura para el listado del objeto pelicula*/
struct MoviesData: Decodable{
    let movies:[Movie]
    
    private enum CodingKeys: String, CodingKey{
        case movies = "results"
    }
}

/*Se crea una estructura para poder manejar como un objeto*/
struct Movie: Decodable{
    let id:Int64?
    let title:String?
    let year: String?
    let rate:Double?
    let posterImage:String?
    let overview:String?
        /*Se codifican las varaibles extraidas del json*/
    private enum CodingKeys: String, CodingKey{
        case title, overview, id
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}

struct AuthorsData: Decodable{
    let authors:[Author]
    
    private enum CodingKeys: String, CodingKey{
        case authors = "cast"
    }
}


struct Author: Decodable {
    let name:String?
    let original_name:String?
    
    private enum CodingKeys: String,CodingKey{
        case name, original_name
    }
}
