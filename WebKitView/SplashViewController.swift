//
//  SplashViewController.swift
//  WebKitView
//
//  Created by Mehmet Tırpan on 14.05.2024.
//

import UIKit

class SplashViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView!
    var imageView: UIImageView!
    var designedByLabel: UILabel!

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Arka plan rengi veya görüntüsü ayarlayın
        self.view.backgroundColor = .systemBackground

        // Görseli ekleyin
        imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        // Activity Indicator ekleyin
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator)

        // "Designed By Mehmet TIRPAN" etiketini ekleyin
        designedByLabel = UILabel()
        designedByLabel.text = "Designed By Mehmet TIRPAN"
        designedByLabel.textColor = .gray
        designedByLabel.textAlignment = .center
        designedByLabel.font = UIFont.systemFont(ofSize: 14)
        designedByLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(designedByLabel)
        
        // Auto Layout ayarları
        NSLayoutConstraint.activate([
            // Logo görseli için Auto Layout ayarları
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),  // Görselin genişliği (ekran genişliğinin %60'ı)
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor), // Görselin yüksekliği, genişliğine eşit (kare olması için)

            // Activity Indicator için Auto Layout ayarları
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),

            // "Designed By Mehmet TIRPAN" etiketi için Auto Layout ayarları
            designedByLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            designedByLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            designedByLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        activityIndicator.startAnimating()

        // Simulate a delay to show the splash screen for a bit
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showMainScreen()
        }
    }

    func showMainScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainViewController.modalTransitionStyle = .crossDissolve
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
}
