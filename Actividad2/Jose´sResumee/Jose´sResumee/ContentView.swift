//
//  ContentView.swift
//  Jose´sResumee
//
//  Created by José Alberto Rocha Munguía on 30/01/26.
//

import SwiftUI

// Color coral para botones y acentos
private let coral = Color(red: 1.0, green: 0.25, blue: 0.25)
private let coralSuave = Color(red: 1.0, green: 0.25, blue: 0.25).opacity(0.15)

struct ContentView: View {
    let nombre = "José Alberto Rocha Munguía"
    let edad = 20
    // Tupla: (nombre del proyecto, descripción breve)
    let experiencia: [(nombre: String, tipo: String)] = [
        ("Videojuego", "Desarrollo de videojuego"),
        ("ATM", "Sistema cajero automático"),
        ("Memorama", "Juego de memoria")
    ]
    // Tupla para datos de contacto
    let contacto: (email: String, telefono: String) = (
        "josealrocmun@outlook.com",
        "+52 5633651718"
    )

    @State private var mostrarAlerta = false
    @State private var mostrarTelefono = true
    @State private var añosExperiencia: Double = 2
    @State private var mostrarDetalles = true

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Foto y nombre
                VStack(spacing: 12) {
                    // Añade FotoCV.png a Assets.xcassets en Xcode (nombre: FotoCV)
                    Image("FotoCV")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(coral, lineWidth: 3)
                        )
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)

                    Text(nombre)
                        .font(.title2.bold())
                        .foregroundStyle(.primary)
                    Text("\(edad) años")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                // Slider: años de experiencia
                VStack(alignment: .leading, spacing: 8) {
                    Text("Años de experiencia (estimado)")
                        .font(.subheadline.bold())
                        .foregroundStyle(.secondary)
                    HStack {
                        Slider(value: $añosExperiencia, in: 0...10, step: 1)
                            .tint(coral)
                        Text("\(Int(añosExperiencia))")
                            .font(.subheadline.bold())
                            .foregroundColor(coral)
                            .frame(width: 28)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(coralSuave)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 20)

                // Toggle: mostrar u ocultar detalles
                HStack {
                    Text("Mostrar detalles de contacto")
                        .font(.subheadline)
                    Spacer()
                    Toggle("", isOn: $mostrarDetalles)
                        .labelsHidden()
                        .tint(coral)
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.separator), lineWidth: 0.5)
                )
                .padding(.horizontal, 20)

                if mostrarDetalles {
                    // Contacto
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Contacto")
                            .font(.headline)
                            .foregroundColor(coral)

                        Link(destination: URL(string: "mailto:\(contacto.email)")!) {
                            HStack {
                                Image(systemName: "envelope.fill")
                                Text(contacto.email)
                                    .lineLimit(1)
                            }
                            .font(.subheadline)
                            .foregroundColor(coral)
                        }

                        if mostrarTelefono {
                            Link(destination: URL(string: "tel:\(contacto.telefono.replacingOccurrences(of: " ", with: ""))")!) {
                                HStack {
                                    Image(systemName: "phone.fill")
                                    Text(contacto.telefono)
                                }
                                .font(.subheadline)
                                .foregroundColor(coral)
                            }
                        }

                        Toggle("Mostrar número de teléfono", isOn: $mostrarTelefono)
                            .font(.caption)
                            .tint(coral)

                        Link(destination: URL(string: "https://github.com/AkJoss")!) {
                            HStack {
                                Image(systemName: "chevron.left.forwardslash.chevron.right")
                                Text("GitHub: AkJoss")
                            }
                            .font(.subheadline)
                            .foregroundColor(coral)
                        }

                        Link(destination: URL(string: "https://www.linkedin.com/in/jarm2605")!) {
                            HStack {
                                Image(systemName: "link")
                                Text("LinkedIn: jarm2605")
                            }
                            .font(.subheadline)
                            .foregroundColor(coral)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(coralSuave)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 20)
                }

                // Proyectos (Experiencia)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Proyectos")
                        .font(.headline)
                        .foregroundColor(coral)

                    ForEach(experiencia.indices, id: \.self) { i in
                        let item = experiencia[i]
                        HStack(spacing: 12) {
                            Text("\(i + 1)")
                                .font(.caption.bold())
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                                .background(coral)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.nombre)
                                    .font(.subheadline.bold())
                                Text(item.tipo)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 20)

                // Botón y Alerta
                Button {
                    mostrarAlerta = true
                } label: {
                    HStack {
                        Image(systemName: "paperplane.fill")
                        Text("Contactar")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(coral)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
                .alert("¿Enviar mensaje?", isPresented: $mostrarAlerta) {
                    Button("Cancelar", role: .cancel) {}
                    Button("Enviar email") {
                        if let url = URL(string: "mailto:\(contacto.email)") {
                            UIApplication.shared.open(url)
                        }
                    }
                    Button("Llamar") {
                        if let url = URL(string: "tel:\(contacto.telefono.replacingOccurrences(of: " ", with: ""))") {
                            UIApplication.shared.open(url)
                        }
                    }
                } message: {
                    Text("Puedes enviar un correo a \(contacto.email) o llamar al \(contacto.telefono).")
                }
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    ContentView()
}
