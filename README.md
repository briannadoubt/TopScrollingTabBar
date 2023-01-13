# TopScrollingTabBar

TopScrollingTabBar is a simple feature that allows for one to display a set of tabs across the top of their app/feature. The tabs scroll horizontally, and there is no limit to the number of tabs.

## Usage

First create a set of Tabs by conforming to the `TopTab` protocol. These objects could also be dynamically rendered from an API:
```swift
enum PreviewTab: String, TopTab {
    case saved
    case booked
    case pending
    case confirmed
    case archived
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .saved:
            return "Saved"
        case .booked:
            return "Booked"
        case .pending:
            return "Pending"
        case .confirmed:
            return "Confirmed"
        case .archived:
            return "Archived"
        }
    }
}
```

Then, stick that `TopTab` conforming object somewhere behind a bindable property wrapper (`@State`, `@Binding`, `@Published`, etc), and bind it to the `TopScrollingTabBar` view.

Inside the `Content` of the `TopScrollingTabBar`, add the view you'd like to display for the given tab:

```swift
struct ContentView: View {
    
    @State var selection: PreviewTab = .saved
    
    var body: some View {
        TopScrollingTabBar(selection: $selection.animation()) { tab in
            // For demo purposes
            List {
                Text(tab.title)
                    .bold()
                    .font(.largeTitle)
                Text("Something that is \(tab.title)")
            }
            .listStyle(.plain)
            
            // In a full app I'd switch on the Tab enum and generate the appropriate view.
//            switch tab {
//            case .saved:
//                SavedThings()
//            case .booked:
//                ...etc
//            }
        }
    }
}
```
