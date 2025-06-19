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

<pre lang="markdown"> ### 📂 Project Structure ``` Widgets/ ├── WidgetsExtension/ # Widget main target │ ├── Widgets.swift # Widget configuration │ ├── Provider.swift # Timeline provider │ ├── WidgetEntry.swift # Entry & data model │ ├── WidgetView.swift # SwiftUI view layout │ └── Assets.xcassets # Widget assets ├── Shared/ # (Optional) Shared models/utilities ├── App/ # Main app entry point └── README.md ``` </pre>


## ⚠️ Note

This is a **Widget Extension only** and cannot run independently.  
To test or run the widget, integrate it into the main iOS app and launch from the main target.
