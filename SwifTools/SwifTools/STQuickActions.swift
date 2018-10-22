//
//  STQuickActions.swift
//  SwifTools
//
//  Created by Jason Pierna on 10/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import Foundation

public class STQuickActions {
    /**
     Singleton.
    */
    public static let shared = STQuickActions()
    
    private init() {}
    
    /**
     Enumerates every quick action position (1 to 4)
    */
    public enum Action: String {
        case first, second, third, fourth
    }
    
    var items = [UIApplicationShortcutItem]()
    var handlers = [Action: () -> Bool]()
    
    /**
     Adds a new Home Screen Quick Action to the application.
     - parameter title: The Quick Action's title
     - parameter subtitle: The Quick Action's subtitletitle
     - parameter icon: The Quick Action's icon
     - parameter userInfo: The Quick Action's userInfo
     - parameter handler: Block of code triggered by the quick action.
     */
    public func add(title: String, subtitle: String? = nil, icon: UIApplicationShortcutIconType? = nil, userInfo: [AnyHashable : Any]? = nil, handler: (() -> Bool)? = nil) {
        
        var image: UIApplicationShortcutIcon?
        if let icon = icon {
            image = UIApplicationShortcutIcon(type: icon)
        }
        
        if items.count < 4 {
            
            let type = shortcutType(count: items.count)
            
            let shortcut = UIApplicationShortcutItem(type: type.rawValue, localizedTitle: title, localizedSubtitle: subtitle, icon: image, userInfo: userInfo)
            items.append(shortcut)
            
            UIApplication.shared.shortcutItems = items
            
            if let handler = handler {
                handlers[type] = handler
            }
        }
        else {
            NSLog("SwifTools: Maximum quick actions reached")
        }
    }
    
    /**
     Removes a Home Screen Quick Action.
     - parameter type: The type of the quick action to remove.
     */
    public func remove(_ type: Action) {
        let index = items.index(where: { shortcut in
            return shortcut.type == type.rawValue
        })
        
        if let index = index {
            items.remove(at: index)
            
            let handlerIndex = handlers.index(where: { (key, _) in
                return key == type
            })
            
            if let handlerIndex = handlerIndex {
                handlers.remove(at: handlerIndex)
            }
            
            UIApplication.shared.shortcutItems = items
        }
    }
    
    /**
     Removes all Home Screen Quick Actions.
     */
    public func removeAll() {
        items.removeAll()
        handlers.removeAll()
        UIApplication.shared.shortcutItems = nil
    }

    /**
     Handles the Quick Action when triggered. This method should be called inside AppDelegate's performAction method.
     - parameter shortcutItem: the shortcut item triggered.
     - parameter completionHandler: pass true if the quick action is handled.
     */
    public func performAction(shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let type = STQuickActions.Action(rawValue: shortcutItem.type) {
            let manager = STQuickActions.shared
            completionHandler(manager.handle(type))
        }
        else {
            completionHandler(false)
        }
    }
    
    /**
     Returns the handler to a specific quick action.
     - parameter type: The type of the wanted quick action.
     */
    public func handle(_ type: Action) -> Bool {
        if let handler = handlers[type] {
            return handler()
        }
        return false
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
