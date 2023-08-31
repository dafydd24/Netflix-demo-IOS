//
//  API.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import Foundation

class API{
    private var dataTask: URLSessionDataTask?
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYjMxYjVhZjU3ZDUwOWUzMjk5OGYxZDhlNzAxNTVkNSIsInN1YiI6IjY0ZWZlNmViM2E5OTM3MDBhZGE5ZjI0NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DhbG0AVgQbqrQGorHZfSvqd-uHZs_Qfny3BpnJj5TsQ"
    
    
    func getAuthors(Id:Int64,completion: @escaping (Result<AuthorsData, Error>) -> Void){
        let MovieUrl = "https://api.themoviedb.org/3/movie/"+String(Id)+"/credits?language=en-US"
        guard let url = URL(string: MovieUrl) else { return }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod="GET"
        
        dataTask = URLSession.shared.dataTask(with: request) { (data,response, error) in
            
            if let error = error{
                completion(.failure(error))
                print("DataTask Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("Empty response")
                return
            }
            print(" Response datus code: \(response.statusCode)")
            guard let data = data else{
                print("Empty Data")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(AuthorsData.self,from: data)
                DispatchQueue.main.async{
                    completion(.success(jsonData))
                }
            }catch let error{
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>)-> Void){
        let populerMoviesURL = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"
        
        guard let url = URL(string: populerMoviesURL) else { return }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod="GET"
        
        dataTask = URLSession.shared.dataTask(with: request) { (data,response, error) in
            
            if let error = error{
                completion(.failure(error))
                print("DataTask Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("Empty response")
                return
            }
            print(" Response datus code: \(response.statusCode)")
            guard let data = data else{
                print("Empty Data")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self,from: data)
                DispatchQueue.main.async{
                    completion(.success(jsonData))
                }
            }catch let error{
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
        
        
    }
}
