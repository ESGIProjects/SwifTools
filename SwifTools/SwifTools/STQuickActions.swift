//
//  STQuickActions.swift
//  SwifTools
//
//  Created by Jason Pierna on 10/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import Foundation

public class STQuickActions {
    static let shared = STQuickActions()
    
    public enum Action: String {
        case first, second, third, fourth
    }
    
    var items = [UIApplicationShortcutItem]()
    
    public func add(title: String, subtitle: String? = nil, icon: UIApplicationShortcutIconType? = nil, userInfo: [AnyHashable : Any]? = nil) {
        
        var image: UIApplicationShortcutIcon?
        if let icon = icon {
            image = UIApplicationShortcutIcon(type: icon)
        }
        
        if items.count < 4 {
            
            let type = shortcutType(count: items.count)
            
            let shortcut = UIApplicationShortcutItem(type: type.rawValue, localizedTitle: title, localizedSubtitle: subtitle, icon: image, userInfo: userInfo)
            items.append(shortcut)
            
            UIApplication.shared.shortcutItems = items
        }
        else {
            NSLog("SwifTools: Maximum quick actions reached")
        }
    }
    
    public func remove(_ type: Action) {
        let index = items.index(where: { shortcut in
            return shortcut.type == type.rawValue
        })
        
        if let index = index {
            items.remove(at: index)
            UIApplication.shared.shortcutItems = items
        }
    }
    
    public func removeAll() {
        items.removeAll()
        UIApplication.shared.shortcutItems = nil
    }
    
    private func shortcutType(count: Int) -> Action {
        switch count {
        case 0:
            return .first
        case 1:
            return .second
        case 2:
            return .third
        case 3:
            return .fourth
        default:
            return .first
        }
    }
    
}
