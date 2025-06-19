# iOS Widget for Dating App(Warm Tribe)

This repository contains a WidgetKit extension for an iOS dating app.  
The widget displays featured streamers, a quick access to search, and recharge options.

## ✨ Features

- Show 3 featured streamers with profile images and names  
- Tap to open streamer profile  
- Provide quick access to search  
- Shortcut to the recharge feature  

## 📱 Requirements

- iOS 14 or later  
- Built using **Swift** and **WidgetKit**  
- Supports multiple widget sizes: `systemSmall`, `systemMedium`

## 📂 Project Structure

Widgets/
├── WidgetsExtension/         # Widget target folder
│   ├── Widgets.swift         # Widget configuration
│   ├── Provider.swift        # Timeline provider
│   ├── WidgetEntry.swift     # Widget data model
│   ├── WidgetView.swift      # SwiftUI layout
│   └── Assets.xcassets       # Widget assets
├── App/                      # Main app (if present)
├── Shared/                   # Shared models or utilities
└── README.md                 # This file


## ⚠️ Note

This is a **Widget Extension only** and cannot run independently.  
To test or run the widget, integrate it into the main iOS app and launch from the main target.
