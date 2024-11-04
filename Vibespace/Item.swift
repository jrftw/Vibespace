import Foundation
import CoreData

@objc(VibespaceItem)
public class VibespaceItem: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var timestamp: Date

    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        self.id = UUID()
        self.timestamp = Date()
    }
}

extension VibespaceItem {
    static func create(in context: NSManagedObjectContext) {
        let newItem = VibespaceItem(context: context)
        newItem.timestamp = Date()
        do {
            try context.save()
        } catch {
            fatalError("Error saving item: \(error.localizedDescription)")
        }
    }
}
