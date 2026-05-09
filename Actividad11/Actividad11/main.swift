//
//  main.swift
//  Actividad12
//
//  Created by José Alberto Rocha Munguía on 22/04/26.
//

import Foundation

// --- MODELOS BASE ---

enum AcademicStatus: String {
    case aprobado = "Aprobado"
    case reprobado = "Reprobado"
    case excelente = "Excelente"
}

enum CourseLevel: String {
    case basico = "Básico"
    case intermedio = "Intermedio"
    case avanzado = "Avanzado"
}

struct Student {
    let id: Int
    let name: String
    let age: Int
    let email: String
}

// --- CLASES DE LÓGICA ---

class Registration {
    let student: Student
    let courseName: String
    var grades: [Double] = []
    
    // Propiedad computada para el promedio
    var average: Double {
        guard !grades.isEmpty else { return 0.0 }
        let suma = grades.reduce(0, +)
        return suma / Double(grades.count)
    }
    
    // Propiedad computada para el estado académico
    var status: AcademicStatus {
        switch average {
        case ..<6:
            return .reprobado
        case ..<9:
            return .aprobado
        default:
            return .excelente
        }
    }
    
    init(student: Student, courseName: String) {
        self.student = student
        self.courseName = courseName
    }
    
    func addGrade(_ grade: Double) {
        // Validación: Calificaciones entre 0 y 10 usando guard
        guard grade >= 0 && grade <= 10 else {
            print("Calificación \(grade) rechazada. Debe estar entre 0 y 10.")
            return
        }
        grades.append(grade)
    }
}

class Course {
    let code: String
    let name: String
    let level: CourseLevel
    let maxCapacity: Int
    var registeredStudents: [Registration] = []
    
    init(code: String, name: String, level: CourseLevel, maxCapacity: Int) {
        self.code = code
        self.name = name
        self.level = level
        self.maxCapacity = maxCapacity
    }
    
    func registerStudent(_ student: Student) -> Registration? {
        // Validación: No exceder cupo
        guard registeredStudents.count < maxCapacity else {
            print("Error: Cupo máximo alcanzado en el curso \(name).")
            return nil
        }
        
        // Validación: Evitar duplicados (ID de estudiante)
        guard !registeredStudents.contains(where: { $0.student.id == student.id }) else {
            print("Error: El estudiante \(student.name) ya está en este curso.")
            return nil
        }
        
        let newRegistration = Registration(student: student, courseName: self.name)
        registeredStudents.append(newRegistration)
        return newRegistration
    }
}

// --- SISTEMA PRINCIPAL ---

class CampusSystem {
    var students: [Student] = []
    var courses: [Course] = []
    var allRegistrations: [Registration] = []
    
    func createStudent(id: Int, name: String, age: Int, email: String) {
        // Validaciones solicitadas
        guard !name.isEmpty else {
            print("El nombre no puede estar vacío")
            return
        }
        guard age >= 16 else {
            print("La edad no puede ser menor a 16")
            return
        }
        guard email.contains("@") else {
            print("El correo no es válido")
            return
        }
        
        let newStudent = Student(id: id, name: name, age: age, email: email)
        students.append(newStudent)
        print("Estudiante \(name) agregado correctamente.")
    }
    
    func createCourse(code: String, name: String, level: CourseLevel, capacity: Int) {
        let newCourse = Course(code: code, name: name, level: level, maxCapacity: capacity)
        courses.append(newCourse)
        print("Curso \(name) agregado correctamente.")
    }
    
    func enrollStudent(studentId: Int, courseCode: String) {
        guard let student = students.first(where: { $0.id == studentId }),
              let course = courses.first(where: { $0.code == courseCode }) else {
            print("Error: Estudiante o Curso no encontrados.")
            return
        }
        
        if let registration = course.registerStudent(student) {
            allRegistrations.append(registration)
            print("Inscripción realizada correctamente.")
        }
    }
    
    func addGradeToStudent(studentId: Int, courseCode: String, grade: Double) {
        if let registration = allRegistrations.first(where: { $0.student.id == studentId &&
            courses.first(where: { $0.code == courseCode })?.name == $0.courseName }) {
            registration.addGrade(grade)
            print("Calificación \(grade) agregada a \(registration.student.name).")
        }
    }
    
    func printFinalReport() {
        print("\n=== REPORTE FINAL ===")
        for reg in allRegistrations {
            print("Estudiante: \(reg.student.name)")
            print("Curso: \(reg.courseName)")
            print("Calificaciones: \(reg.grades)")
            print("Promedio: \(reg.average)")
            print("Estado: \(reg.status.rawValue)")
            print("----------------------")
        }
    }
}

// --- PRUEBA DEL SISTEMA ---

let system = CampusSystem()

// Registro de Ana
system.createStudent(id: 1, name: "Ana", age: 21, email: "Ana@gmail.com")
system.createCourse(code: "SW-01", name: "Swift Básico", level: .basico, capacity: 5)

// Inscripción y calificaciones
system.enrollStudent(studentId: 1, courseCode: "SW-01")
system.addGradeToStudent(studentId: 1, courseCode: "SW-01", grade: 9.5)
system.addGradeToStudent(studentId: 1, courseCode: "SW-01", grade: 8.0)

// Reporte
system.printFinalReport()
