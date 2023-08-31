//
//  MovieViewModel.swift
//  Netflix
//
//  Created by ec2-user on 8/31/23.
//

import Foundation


class MovieViewModel{
    private var apiService = API()
    private var popularMovies = [Movie]()
    
    func fetchPopularMovie(completion: @escaping () -> ()){
        apiService.getPopularMoviesData{[weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case .failure(let error):
                print("Error procesando json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        if popularMovies.count != 0 {
            return popularMovies.count
            
        }
        return 0
    }
    
    
    func cellForRowAt(indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
    
    
}
