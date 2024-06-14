//
//  SignFeature.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/06/14
//  
//

import ComposableArchitecture

@Reducer
struct SignFeature {

    @ObservableState
    struct State: Equatable {

        var mode: SignMode
        var accountID: String
        var password: String
        var passwordConfirm: String
        var gender: Gender

        init(
            mode: SignMode = .signUp,
            accountID: String = "",
            password: String = "",
            passwordConfirm: String = "",
            gender: Gender = .other
        ) {
            self.mode = mode
            self.accountID = accountID
            self.password = password
            self.passwordConfirm = passwordConfirm
            self.gender = gender
        }
    }

    enum Action: Equatable {
        case accountIDInput(value: String)
        case passwordInput(value: String)
        case passwordConfirmInput(value: String)
        case genderInput(value: String)
        case signInButtonTapped
        case signUpButtonTapped
        case modeChange
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .accountIDInput(let value):
                    state.accountID = value
                    // TODO: Validation
                    return .none
                case .passwordInput(let value):
                    state.password = value
                    // TODO: Validation
                    return .none
                case .passwordConfirmInput(let value):
                    state.passwordConfirm = value
                    // TODO: Validation
                    return .none
                case .genderInput(let value):
                    state.gender = Gender.make(key: value)
                    // TODO: Validation
                    return .none
                case .modeChange:
                    switch state.mode {
                        case .signIn:
                            state.mode = .signUp
                        case .signUp:
                            state.mode = .signIn
                    }
                    return .none
                case .signInButtonTapped:
                    // TODO: signIn logic
                    return .none
                case .signUpButtonTapped:
                    // TODO: signUp logic
                    return .none
            }
        }
    }

}
