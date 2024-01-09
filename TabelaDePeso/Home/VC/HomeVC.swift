//
//  ViewController.swift
//  TabelaDePeso
//
//  Created by Pedro Ribeiro on 03/01/2024.
//

import UIKit



class HomeVC: UIViewController {
    
    
    
    
    var homeScreen = HomeScreen()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        homeScreen.delegate(delegate: self)
    }
    
    //func calularPeso(_ calcular: Float) {
    
    
    //func converterFloat(_sender: Any) {
    
    //   if let texto1 = homeScreen.pesoTextField.text, let texto2 = homeScreen.alturaTextField.text,
    //    let numero1 = Float(texto1), let numero2 = Float(texto2) {
    
    //   let resultado = numero1 + numero2
    
    
}


extension HomeVC: HomeScreenProtocol {
    var peso: Double {
        get {
            home
        }
        set {
            <#code#>
        }
    }
    
    var altura: Double {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    func tappedCalcularButton(peso: Double, altura: Double) -> String {
        
        var imc = peso / (altura * altura)
        var resultado: String
        
        switch imc {
        case 0..<18.5:
            resultado = "Abaixo do peso"
        case 18.6..<24.9:
            resultado = "Peso ideal (Parabéns!!)"
        case 25.0..<29.9:
            resultado = "Levemente acima do peso"
        case 30.0..<34.9:
            resultado = "Obesidade grau 1"
        case 35.0..<39.9:
            resultado = "Obesidade grau 2 (severa)"
        default:
            resultado = "Obesidade grau 3 (mórbida)"
            
            
        }
        
        return resultado
        
    }
    func customNavigation() {
        let vc = ResultadoVC(resultado: self.tappedCalcularButton(peso: <#T##Double#>, altura: <#T##Double#>))
    }
    
    
}


