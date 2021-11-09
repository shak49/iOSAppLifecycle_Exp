//
//  State.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/9/21.
//

import UIKit


struct State: Codable {
  var events: [Event] = []
    
  func byAppending(event: Event) -> State {
    var newState = self
    newState.events.append(event)
    return newState
  }
}

struct Event: Codable {
  let kind: Kind
  let date: Date
  let applicationStatus: String

  enum Kind: String, Codable {
    case appWillFinishLaunching
    case appDidFinishLaunching
    case appWillTerminate
    case appWillResignActive
    case appDidBecomeActive
    case appDidEnterBackground
    case appWillEnterForeground
  }
}

extension Event {
    init(with application: UIApplication, event kind: Kind) {
    self = Event(kind: kind, date: Date(), applicationStatus: "\(application.applicationState)")
    }
}


