//
//  HomeVC.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import UIKit

class HomeVC: UIViewController {
    
    //var apiService = API()
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MovieViewModel()
    var apiService = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*quitar la navigationBar*/
        navigationController?.setNavigationBarHidden(true, animated: false)
        loadPopularMoviesData()
    }
    /*llamar a la funcion para obtener todas las peliculas*/
    private func loadPopularMoviesData(){
        viewModel.fetchPopularMovie { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
    @IBAction func logoutUser(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGIN")
        self.navigationController?.popToRootViewController(animated: true)
    }

}


extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return viewModel.numberOfRowsInSection(section: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
        
    }
    
    func tableView (_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMovieVC") as? DetailMovieVC
        //vc?.id = viewModel.cellForRowAt(indexPath: indexPath).id
        //vc?.overview = viewModel.cellForRowAt(indexPath: indexPath).overview ?? <#default value#>
        navigationController?.pushViewController(vc!, animated: true)
    }
}
