//
//  ResultadoViewController.swift
//  TabelaDePeso
//
//  Created by Pedro Ribeiro on 06/01/2024.
//

import UIKit

class ResultadoVC: UIViewController {
    
    var resultado: String
    
    init(resultado: String) {
        
        self.resultado = resultado
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    var homeScreen: ResultadoScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = ResultadoScreen(imcResultado: resultado)
        view = homeScreen
        view.backgroundColor = .red
        homeScreen?.delegate(delegate: self)
        
    }
    


}

extension ResultadoVC: ResultadoScreenProtocol {
    func tappedMostrarResultado() {
        
        
    }
    
}
