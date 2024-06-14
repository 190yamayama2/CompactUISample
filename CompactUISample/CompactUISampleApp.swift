//
//  CompactUISampleApp.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/03/31
//  
//

import SwiftUI
import CompactUI
import ComposableArchitecture

@main
struct CompactUISampleApp: App {
    var body: some Scene {
        WindowGroup {
            SignView(
                store: Store(
                    initialState: SignFeature.State(),
                    reducer: {
                        SignFeature()
                    }
                ),
                layout: SignView.Layout(
                    signInLayout: SignView.SignInLayout(
                        titleText: "Sign in",
                        accountIdFieldLayout: LabeledInputTextView.Layout(
                            labelText: "Please enter account id.",
                            textLayout: GeneralTextView.Layout(
                                maxLength: 16,
                                placeholder: "Please enter your name."
                            )
                        ),
                        passwordFieldLayout: LabeledInputPasswordView.Layout(
                            labelText: "Please enter password.",
                            passwordLayout: GeneralPasswordTextView.Layout(
                                maxLength: 16,
                                placeholder: "8 to 16 half-width alphanumeric characters."
                            )
                        ),
                        signInButtonLayout: GeneralButtonView.Layout(
                            text: "Sign in",
                            height: 40,
                            textForegroundColor: .white,
                            backgroundColor: .gray,
                            hasBorder: true,
                            cornerRadius: 16
                        ),
                        signUpButtonLayout: GeneralButtonView.Layout(
                            text: "If you already have an account, sign in",
                            height: 40,
                            textForegroundColor: .gray,
                            hasTextUnderLine: true,
                            backgroundColor: .clear,
                            hasBorder: false,
                            cornerRadius: 16
                        )
                    ),
                    signUpLayout: SignView.SignUpLayout(
                        titleText: "Sign up",
                        accountIdFieldLayout: LabeledInputTextView.Layout(
                            labelText: "Please enter account id.",
                            textLayout: GeneralTextView.Layout(
                                maxLength: 16,
                                placeholder: "Please enter your name."
                            )
                        ),
                        firstPasswordFieldLayout: LabeledInputPasswordView.Layout(
                            labelText: "Please enter password.",
                            passwordLayout: GeneralPasswordTextView.Layout(
                                maxLength: 16,
                                placeholder: "8 to 16 half-width alphanumeric characters."
                            )
                        ),
                        secondPasswordFieldLayout: LabeledInputPasswordView.Layout(
                            labelText: "Please enter your password again.",
                            passwordLayout: GeneralPasswordTextView.Layout(
                                maxLength: 16,
                                placeholder: "8 to 16 half-width alphanumeric characters."
                            )
                        ),
                        signUpButtonLayout: GeneralButtonView.Layout(
                            text: "Sign up",
                            height: 40,
                            textForegroundColor: .white,
                            backgroundColor: .gray,
                            hasBorder: true,
                            cornerRadius: 16
                        ),
                        signInButtonLayout: GeneralButtonView.Layout(
                            text: "Sign in because you don't have an account",
                            height: 40,
                            textForegroundColor: .gray,
                            hasTextUnderLine: true,
                            backgroundColor: .clear,
                            hasBorder: false,
                            cornerRadius: 16
                        )
                    )
                )
            )
        }
    }
}
