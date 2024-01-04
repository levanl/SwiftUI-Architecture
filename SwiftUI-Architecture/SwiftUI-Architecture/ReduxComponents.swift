//
//  ReduxComponents.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 04.01.24.
//

import Foundation
import NetworkingPackageGeneric



protocol Action {
    
}


// MARK: - Actions
struct FetchAPODAction: Action {
    
    init() {
        let url = "https://api.nasa.gov/planetary/apod?api_key=BH1ZSRa00CkbTzMsvtOuUkM6rqtd0yFTxYOj9qYZ"
        
        NetworkManager.fetchData(from: url, modelType: APODModel.self) { result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    let newAction = SetAPODInfoAction(APODInfo: [data])
                    story.dispatch(action: newAction)
                    print("sucess")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct SetAPODInfoAction: Action {
    let APODInfo: [APODModel]
}

// MARK: State
struct State {
    var APODInfo: [APODModel] = []
}


// MARK: - Reducer

func reducer(action: Action, state: State) -> State {
    var state = state
    
    
    switch action {
    case let action as FetchAPODAction:
        print("FetchAPODAction")
        //        state.APODInfo.append(action.APODInfo)
    case let action as SetAPODInfoAction:
        print("SetAPODInfoAction")
        state.APODInfo.append(contentsOf: action.APODInfo)
    default:
        break
    }
    
    return state
}


typealias Reducer = (Action, State) -> State


// MARK: - Story

let story = ApplicationStory(reducer: reducer)

class ApplicationStory: ObservableObject {
    
    var reducer: Reducer
    @Published var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(action, self.state)
        }
    }
}
