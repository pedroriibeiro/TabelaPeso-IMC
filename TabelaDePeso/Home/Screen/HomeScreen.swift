//
//  HomeView.swift
//  TabelaDePeso
//
//  Created by Pedro Ribeiro on 03/01/2024.
//

protocol HomeScreenProtocol: AnyObject {
    func tappedCalcularButton(peso: Double, altura: Double) -> String
    var peso: Double { get set }
    var altura: Double { get set }
    }


import UIKit

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var logoImg: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "balançaImg")
        
        return img
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "BALANCER"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var fundoImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundImg")
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Vamos calcular seu índice de massa corporal:"
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var pesoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Quanto você pesa?"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var pesoTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu peso         ex: 59.4", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numbersAndPunctuation
        tf.autocorrectionType = .no
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var alturaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Qual sua altura?"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var alturaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua altura         ex: 1.74", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numbersAndPunctuation
        tf.autocorrectionType = .no
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var botaoImg: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "botaoImg")
        return img
    }()
    
    lazy var calcularButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Continuar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(tappedCalcularButton), for: .touchUpInside)
       return btn
    }()
    
    @objc func tappedCalcularButton(_ sender: UIButton) { 
        if let peso = Double(pesoTextField.text ?? ""), let altura = Double(alturaTextField.text ?? "") {
            delegate?.tappedCalcularButton(peso: peso, altura: altura)
            
        }
    }
    
    private func addElements() {
        addSubview(fundoImg)
        addSubview(logoLabel)
        addSubview(logoImg)
        addSubview(descriptionLabel)
        addSubview(pesoLabel)
        addSubview(pesoTextField)
        addSubview(alturaLabel)
        addSubview(alturaTextField)
        addSubview(botaoImg)
        addSubview(calcularButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            fundoImg.topAnchor.constraint(equalTo: topAnchor),
            fundoImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoImg.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoImg.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            logoImg.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 120),
            logoImg.widthAnchor.constraint(equalToConstant: 120),
            
            
             logoLabel.topAnchor.constraint(equalTo: logoImg.bottomAnchor
                                            , constant: 5),
             logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            
            pesoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            pesoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            pesoTextField.topAnchor.constraint(equalTo: pesoLabel.bottomAnchor, constant: 10),
            pesoTextField.leadingAnchor.constraint(equalTo: pesoLabel.leadingAnchor),
            pesoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            alturaLabel.topAnchor.constraint(equalTo: pesoTextField.bottomAnchor, constant: 20),
            alturaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
           
            
            alturaTextField.topAnchor.constraint(equalTo: alturaLabel.bottomAnchor, constant: 10),
            alturaTextField.leadingAnchor.constraint(equalTo: pesoTextField.leadingAnchor),
            alturaTextField.trailingAnchor.constraint(equalTo: pesoTextField.trailingAnchor),
            
            botaoImg.topAnchor.constraint(equalTo: alturaTextField.bottomAnchor, constant: 50),
            botaoImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            botaoImg.heightAnchor.constraint(equalToConstant: 80),
            botaoImg.widthAnchor.constraint(equalToConstant: 140),
            
            calcularButton.topAnchor.constraint(equalTo: botaoImg.topAnchor, constant: 20),
            calcularButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            
            
            
            
            
            
        ])
    }
    
}
