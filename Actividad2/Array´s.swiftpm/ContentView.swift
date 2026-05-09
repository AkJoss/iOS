import SwiftUI

// Color coral personalizado
extension Color {
    static let coral = Color(red: 1.0, green: 0.25, blue: 0.25)
}

struct ContentView: View {
    @State private var numeros = [1, 2, 3, 4, 5]

    var body: some View {
        VStack(spacing: 16) {
            Text("Arreglo: \(numeros.map(String.init).joined(separator: ", "))")
                .font(.headline)
                .padding()

            // AÑADIR
            Group {
                Text("Añadir").font(.subheadline.bold())
                HStack {
                    Button("append(6)") {
                        numeros.append(6)
                    }
                    Button("insert(0, at: 0)") {
                        numeros.insert(0, at: 0)
                    }
                    Button("+= [7,8]") {
                        numeros += [7, 8]
                    }
                }
                .buttonStyle(.bordered)
                .tint(.coral)
            }

            // QUITAR
            Group {
                Text("Quitar").font(.subheadline.bold())
                HStack {
                    Button("removeLast()") {
                        if !numeros.isEmpty { numeros.removeLast() }
                    }
                    Button("removeFirst()") {
                        if !numeros.isEmpty { numeros.removeFirst() }
                    }
                    Button("remove(at: 1)") {
                        if numeros.count > 1 { _ = numeros.remove(at: 1) }
                    }
                }
                .buttonStyle(.bordered)
                .tint(.coral)
            }

            // CAMBIAR
            Group {
                Text("Cambiar").font(.subheadline.bold())
                HStack {
                    Button("[0] = 99") {
                        if !numeros.isEmpty { numeros[0] = 99 }
                    }
                    Button("swapAt(0,1)") {
                        if numeros.count > 1 { numeros.swapAt(0, 1) }
                    }
                    Button("replaceSubrange") {
                        if numeros.count >= 2 {
                            numeros.replaceSubrange(0..<2, with: [10, 20])
                        }
                    }
                }
                .buttonStyle(.bordered)
                .tint(.coral)
            }

            Button("Reset") {
                numeros = [1, 2, 3, 4, 5]
            }
            .buttonStyle(.borderedProminent)
            .tint(.coral)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
