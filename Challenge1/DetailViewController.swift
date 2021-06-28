//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Luca Hummel on 28/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    var flagImage: String = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(flagImage)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        imageView.image = UIImage(named: flagImage)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor

        
        // Do any additional setup after loading the view.
    }
    
    @objc func shareFlag() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, flagImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
