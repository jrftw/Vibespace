import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \VibespaceItem.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<VibespaceItem>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: Text("Item at \(item.timestamp, formatter: itemFormatter)")) {
                        Text(item.timestamp, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("VibeSpace")
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                #elseif os(macOS)
                ToolbarItem(placement: .automatic) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                #endif
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = VibespaceItem(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
