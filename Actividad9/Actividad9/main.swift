//
//  main.swift
//  Act9
//
//  Created by José Alberto Rocha Munguía on 08/04/26.
//


class Usuario {
    
    var nombre: String
    var email: String
    private var password: String
    private(set) var activo: Bool
    
    init(nombre: String, email: String, password: String, activo: Bool) {
        self.nombre = nombre
        self.email = email
        self.password = password
        self.activo = activo
    }
    
    convenience init(nombre: String, email: String) {
        self.init(nombre: nombre, email: email, password: "123456", activo: true)
    }
    
    func login(password: String) -> Bool {
        return password == self.password
    }
    
    func cambiarPassword(actual: String, nueva: String) -> Bool {
        if actual == password && nueva.count >= 6 {
            password = nueva
            return true
        }
        return false
    }
    
    func activar() {
        activo = true
    }
    
    func desactivar() {
        activo = false
    }

    fileprivate func cambiarPasswordDirecto(nueva: String) {
        if nueva.count >= 6 {
            password = nueva
        }
    }
    
    func descripcion() {
        print("Nombre: \(nombre), Email: \(email), Activo: \(activo)")
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Administrador: Usuario {
    
    var nivelAcceso: Int
    
    init(nombre: String, email: String, password: String, activo: Bool, nivelAcceso: Int) {
        self.nivelAcceso = nivelAcceso
        super.init(nombre: nombre, email: email, password: password, activo: activo)
    }
    
    override func descripcion() {
        print("Nombre: \(nombre), Email: \(email), Activo: \(activo), Nivel: \(nivelAcceso)")
    }
    
    func eliminarUsuario(_ usuario: Usuario) {
        if nivelAcceso >= 5 {
            usuario.desactivar()
        } else {
            print("No tienes permiso")
        }
    }
    
    func resetearPassword(usuario: Usuario, nueva: String) {
        if nivelAcceso >= 5 {
            usuario.cambiarPasswordDirecto(nueva: nueva)
        } else {
            print("No tienes permiso")
        }
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Cliente: Usuario {
    
    private var saldo: Double = 0
    fileprivate var historialCompras: [String] = []
    
    func depositar(_ cantidad: Double) {
        if cantidad > 0 {
            saldo += cantidad
        }
    }
    
    func comprar(producto: String, precio: Double) {
        if precio <= saldo {
            saldo -= precio
            historialCompras.append(producto)
        } else {
            print("No tienes saldo suficiente")
        }
    }
    
    func verSaldo() -> Double {
        return saldo
    }
    
    override func descripcion() {
        print("Nombre: \(nombre), Email: \(email), Activo: \(activo), Saldo: \(saldo)")
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

let cliente = Cliente(nombre: "José", email: "josealrcomun@gmail.com", password: "123456", activo: true)

cliente.depositar(300)
cliente.comprar(producto: "Libro", precio: 150)
cliente.descripcion()

let admin = Administrador(nombre: "Admin", email: "admin@gmail.com", password: "admin123", activo: true, nivelAcceso: 5)

admin.eliminarUsuario(cliente)
admin.resetearPassword(usuario: cliente, nueva: "abcdef")

cliente.descripcion()
