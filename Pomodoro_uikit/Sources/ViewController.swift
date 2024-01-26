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
    
    private var isWorkTime = true

    
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
        
        let button = UIButton(configuration: config)
        button.tintColor = .orange
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var startWorkButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Start Work"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemOrange
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(startWorkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var startBreakButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Start Break"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(startBreakButtonTapped), for: .touchUpInside)
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
        view.addSubview(startWorkButton)
        view.addSubview(startBreakButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            timeCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeCounterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: timeCounterLabel.bottomAnchor, constant: 30),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            
            startWorkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            startWorkButton.centerYAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 120),
            startWorkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startWorkButton.heightAnchor.constraint(equalToConstant: 40),
            
            startBreakButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            startBreakButton.centerYAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 120),
            startBreakButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startBreakButton.heightAnchor.constraint(equalToConstant: 40),

            
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
                   
                   timeCounterLabel.textColor = isWorkTime ? .systemOrange : .systemBlue
                   playButton.tintColor = isWorkTime ? .systemOrange : .systemBlue
               }
        print("playButtonTapped")
    }
    
    @objc
    private func updateCountdown() {
        
        guard currentCounter > 0 else {
            print("count is already at 0, time to work.")
            return
        }
        
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
    
    @objc
    private func startWorkButtonTapped() {
        currentCounter = 25
        updateLabelCount()
        timeCounterLabel.textColor = .systemOrange
        playButton.tintColor = .systemOrange
        print("startWorkButtonTapped")
    }
    
    @objc
    private func startBreakButtonTapped() {
        currentCounter = 5
        updateLabelCount()
        timeCounterLabel.textColor = .systemBlue
        playButton.tintColor = .systemBlue
        print("startBreakButtonTapped")
    }
}

