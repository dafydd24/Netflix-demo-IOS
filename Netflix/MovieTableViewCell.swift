//
//  MovieTableViewCell.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    
    private var urlString:String=""
    
    func setCellWithValuesOf(_ movie:Movie){
        updateUI(title:movie.title, releaseDate:movie.year, rating:movie.rate, poster: movie.posterImage)
        
    }
    
    
    private func updateUI(title:String?, releaseDate:String?, rating:Double?,poster:String?){
        
        self.movieTitle.text = title
        var fecha:String = convertDateFormater(releaseDate)
        let component = fecha.components(separatedBy: ".")
        print()
        if component[1] == "06" {
            let textColor = UIColor.red
            let atributes: [NSAttributedString.Key:Any] = [.foregroundColor:textColor]
            let attributedText = NSAttributedString(string: fecha, attributes: atributes)
            
            self.movieYear.attributedText = attributedText
        }
        
        
        
        self.movieYear.text = convertDateFormater(releaseDate)
        
        guard let rate = rating else {return }
        
        self.movieRate.text = String(rate)
        
        guard let posterString = poster else {return}
        
        urlString = "https://image.tmdb.org/t/p/w500" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.moviePoster.image = UIImage(named: "NoImageAvailable")
            return
        }
        print(posterImageURL)
        self.moviePoster.image = nil
        
        getImageDataFrom(url:posterImageURL)
    }
    
    
    private func getImageDataFrom(url:URL){
        
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            if let error = error{
                print("DataTask error : \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async{
                if let image = UIImage(data: data){
                    self.moviePoster.image = image
                }
                    
            }
        }.resume()
    }
    
    
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate){
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
            
        }
        return fixDate
        
    }

}
