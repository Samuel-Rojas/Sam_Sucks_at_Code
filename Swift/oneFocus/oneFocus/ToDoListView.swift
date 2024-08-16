//
//  ToDoListView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/14/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var newTask: String = ""
    @State private var tasks: [String] = []

    var body: some View {
        VStack(alignment: .leading) {
            Text("To-Do List")
                .font(.headline)
                .padding()

            HStack {
                TextField("New task...", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)

                Button(action: {
                    if !newTask.isEmpty {
                        tasks.append(newTask)
                        newTask = ""
                    }
                }) {
                    Text("Add")
                }
                .padding(.trailing)
            }

            List {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        Text(tasks[index])
                        Spacer()
                        Button(action: {
                            tasks.remove(at: index)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ToDoListView()
}
