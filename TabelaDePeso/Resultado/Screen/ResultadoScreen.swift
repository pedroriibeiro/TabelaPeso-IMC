//
//  ResultadoScreen.swift
//  TabelaDePeso
//
//  Created by Pedro Ribeiro on 06/01/2024.
//

protocol ResultadoScreenProtocol: AnyObject {
    func tappedMostrarResultado()
    
}


import UIKit

class ResultadoScreen: UIView {
   
    var imcResultado: String
    
    private weak var delegate: ResultadoScreenProtocol?
    
    public func delegate(delegate: ResultadoScreenProtocol) {
        self.delegate = delegate
    }
    
    
    
    lazy var fundoImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundImg")
        return image
    }()
    
    lazy var mensagem: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Lembre-se sempre, seu IMC é algo que pode ser melhorado através de uma reeducação alimentar em complemento com atividades físicas."
        //label.isHidden = true
        label.numberOfLines = 6
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultado: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = imcResultado
        label.isHidden = true
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
  
    @objc func tappedMostrarResultado(_ sender: UIButton) {
        self.delegate?.tappedMostrarResultado()
    }
    
    func addElements() {
        addSubview(mensagem)
        addSubview(resultado)
        
    }
    

    init(frame: CGRect = .zero, imcResultado: String) {
        self.imcResultado = imcResultado
        super.init(frame: frame)
        
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
        
            fundoImg.topAnchor.constraint(equalTo: topAnchor),
            fundoImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoImg.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoImg.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
            mensagem.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            mensagem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mensagem.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            
            resultado.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            resultado.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultado.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
          
        
        ])
    }
    
}
