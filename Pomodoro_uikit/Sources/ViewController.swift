//
//  ViewController.swift
//  Pomodoro_uikit
//
//  Created by Arthur Sh on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    private var timer: Timer?
    private var currentCounter = 25

    
    // MARK: - UI
    
    private lazy var timeCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "\(currentCounter):00"
        label.font = .systemFont(ofSize: 60, weight: .light)
        label.textColor = .orange
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var playButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "play")?.applyingSymbolConfiguration(.init(pointSize: 60))
       
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        
        let button = UIButton(configuration: config)
        button.tintColor = .orange
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(timeCounterLabel)
        view.addSubview(playButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            timeCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeCounterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: timeCounterLabel.bottomAnchor, constant: 30),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func playButtonTapped() {
        if timer == nil {
                   // Start the timer
            timeCounterLabel.textColor = .systemGreen
            playButton.tintColor = .systemGreen
                   timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
               } else {
                   // Stop the timer
                   timer?.invalidate()
                   timer = nil
                   
                   timeCounterLabel.textColor = .orange
                   playButton.tintColor = .orange
               }
        print("playButtonTapped")
    }
    
    @objc
    private func updateCountdown() {
        currentCounter -= 1
        
        updateLabelCount()
        
        
        if currentCounter == 0 {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc
    private func updateLabelCount() {
        timeCounterLabel.text = "\(currentCounter):00"
    }
}

