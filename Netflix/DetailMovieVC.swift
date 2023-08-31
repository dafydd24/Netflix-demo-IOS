//
//  DetailMovieVC.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import UIKit

class DetailMovieVC: UIViewController {

    var id:Int64 = 0
    var overview:String = ""
    var apiService = API()
    @IBOutlet weak var txtDescripcion: UILabel!
    @IBOutlet weak var txtActores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*apiService.getAuthors(Id: id, completion: <#T##(Result<AuthorsData, Error>) -> Void#>){[weak self] (result) in
            switch result {
            case .success(let listOf):
                print(listOf.authors)
                completion()
            case .failure(let error):
                print("Error procesando json data: \(error)")
            }
        }*/
        //txtDescripcion.text = overview

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
