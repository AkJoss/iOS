//
//  ViewController.swift
//  Actividad7
//
//  Created by José Alberto Rocha Munguía on 12/03/26.
//

import UIKit

class EducacionController: UIViewController {

    // Aquí conectarás el Label (Outlet)
    @IBOutlet weak var labelEducacion: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Ocultamos el texto al iniciar la app
        labelEducacion.isHidden = true
    }

    // Aquí conectarás el Botón (Action)
    @IBAction func mostrarTextoPresionado(_ sender: UIButton) {
        labelEducacion.isHidden = false
    }
}
