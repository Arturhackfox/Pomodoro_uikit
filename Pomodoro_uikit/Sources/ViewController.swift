//
//  ViewController.swift
//  Pomodoro_uikit
//
//  Created by Arthur Sh on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var timeCounterLabel: UILabel = {
        let label = UILabel()
        var currentCounter = 25
        label.text = "\(currentCounter):00"
        label.font = .systemFont(ofSize: 60, weight: .light)
        label.textColor = .orange
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            timeCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeCounterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    
    
    
}

