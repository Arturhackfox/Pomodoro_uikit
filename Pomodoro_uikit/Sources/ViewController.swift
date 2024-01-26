//
//  ViewController.swift
//  Pomodoro_uikit
//
//  Created by Arthur Sh on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
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
        view.backgroundColor = .systemGreen

    }
    
    private func setupLayout() {
        
    }

    // MARK: - Actions



}

