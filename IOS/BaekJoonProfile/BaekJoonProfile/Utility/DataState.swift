//
//  DataState.swift
//  BaekJoonProfile
//
//  Created by 박종호 on 2022/02/15.
//

import Foundation

enum DataState<T> : Equatable {
  static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
    switch (lhs,rhs) {
      case (Empty,Empty),
        (Loading,Loading),
        (Error(error: _),Error(error: _)),
        (Success(data: _),Success(data: _)) : return true
      default : return false
    }
  }
  
  case Empty
  case Loading
  case Error(error : Error)
  case Success(data : T)
}

extension DataState {
  var data: T? {
    switch self {
      case .Success(data: let data):
        return data
      default:
        return nil
    }
  }
  
  var loading: Bool {
    return self == .Loading
  }
  
  var error: Error? {
    switch self {
      case .Error(error: let error):
        return error
      default:
        return nil
    }
  }
}
extension DataState : CustomStringConvertible where T: CustomStringConvertible{
  var description: String {
    switch self {
      case .Empty: return "빈 데이터"
      case .Loading: return "\(T.self) 데이터 로딩 중"
      case .Error(let error) : return "\(error.localizedDescription) 에러 상태"
      case .Success(data: let data) : return "\(data) 성공"
    }
  }
}
