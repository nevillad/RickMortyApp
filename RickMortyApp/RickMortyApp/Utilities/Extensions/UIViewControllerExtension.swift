//
//  UIViewControllerExtension.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import UIKit

extension UIViewController: UINavigationControllerDelegate {
    @objc func setupHiddenNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
    }

    /// this changes navigation bar style in the primary color theme of the app.
    @objc func setupPrimaryNavigationBar() {

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = Color.primaryNavbar.value
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back-arrow") , style: UIBarButtonItem.Style.plain, target: self, action: #selector(UIViewController.clickedBack))
        self.navigationController?.navigationBar.tintColor = Color.navBarButtonTint.value
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Color.navBarTitle.value, NSAttributedString.Key.font: Font(.installed(.medium), size: .standard(.h4)).instance]
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: Font(.installed(.book), size: .standard(.h5)).instance], for:.normal)
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: Font(.installed(.book), size: .standard(.h5)).instance], for:.normal)

    }

    // MARK: Click Events
    @objc func clickedBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }

}

extension BaseViewController {
    override func setupHiddenNavigationBar() {
        if #available(iOS 13.0, *) {
            self.statusBarStyle = .darkContent
        } else {
            self.statusBarStyle = .default
        }
        super.setupHiddenNavigationBar()
    }

    override func setupPrimaryNavigationBar() {
        self.statusBarStyle = .lightContent
        super.setupPrimaryNavigationBar()
    }
}
