//
//  BaseViewController.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import UIKit
import Alamofire
import MBProgressHUD
import Reachability

class BaseViewController: UIViewController {
    /// shared instance of delegate is available to all child classes
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    /// It makes user-defauls easily available to all child classes
    let defaults = UserDefaults.standard
    var reachability: Reachability?
    /// loader instance  is avaialble to all child classes
    var progressHUD: MBProgressHUD?

    var statusBarStyle: UIStatusBarStyle = .default

    //MARK: - View Controllers Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set navigation bars Font attribute for all child classes
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.font : Font(.installed(.book), size: .standard(.h5)).instance], for: .normal)
        // Do any additional setup after loading the view.

        if let reachability =  AppUtility.sharedInstance.reachability {
            self.reachability = reachability
            NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
            NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)),name: Notification.Name.reachabilityChanged , object: self.reachability)
        } else {
            self.registerReachability()
        }

        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.showSnackBarForNoInternet), name: NSNotification.Name(rawValue: NOTIF_NO_INTERNET), object: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupPrimaryNavigationBar()
        self.navigationController?.navigationBar.barStyle = self.statusBarStyle == .lightContent ? .black : .default
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.barStyle = self.statusBarStyle == .lightContent ? .black : .default
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged , object: reachability)
    }

    //MARK: Reachability
    func registerReachability() {

        self.reachability = try? Reachability()
        AppUtility.sharedInstance.reachability = self.reachability

        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)),name: Notification.Name.reachabilityChanged , object: self.reachability)

        do {
            try reachability?.startNotifier()
        } catch {
            debugPrint("could not start reachability notifier")
        }
    }

    //MARK:- Indicators
    func showIndicator(_ message: String, showProgress: Bool = false){
        progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        if showProgress {
            progressHUD?.animationType = .zoom
            progressHUD?.contentColor = Color.black.value
            progressHUD?.mode = MBProgressHUDMode.annularDeterminate
            progressHUD?.progress = 0.02
        } else {
            progressHUD?.mode = MBProgressHUDMode.indeterminate
        }

        if !message.isEmpty() {
            progressHUD?.label.text = NSLocalizedString(message, comment: "progress bar title")
        }
    }

    func updateProgressForIndicator(progress : Double) {
        progressHUD?.progress = Float(progress)
    }

    func hideIndicator(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }

    // MARK: - Objective-C exposed methods
    @objc
    func reachabilityChanged(_ note: Notification) {

        guard let reachability = note.object as? Reachability else {
            return debugPrint("*** object not registered properly")
        }

        if reachability.connection != .unavailable && !AppUtility.sharedInstance.isOnline {
            DispatchQueue.main.async {
                AppUtility.sharedInstance.isOnline = true
                // Disable network prompt if network is reachable
            }
        } else {
            AppUtility.sharedInstance.isOnline = false
            if reachability.connection != .unavailable {
                DispatchQueue.main.async {
                    //Show prompt here
                }
            }
            debugPrint("Network not reachable")
        }
    }

    @objc
    func showSnackBarForNoInternet() {

    }
}
