//
//  SignView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/06/14
//  
//

import SwiftUI
import CompactUI
import ComposableArchitecture

struct SignView: View {

    // MARK: - Properties

    let store: StoreOf<SignFeature>
    let layout: Layout

    // MARK: - Initializer

    init(
        store: StoreOf<SignFeature>,
        layout: Layout
    ) {
        self.store = store
        self.layout = layout
    }

    // MARK: - View

    var body: some View {
        switch store.mode {
            case .signIn:
                singIn
            case .signUp:
                singUp
        }
    }

    private var singIn: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Spacer()
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            Text(layout.signInLayout.titleText)
                .font(layout.signInLayout.titleFont)
            Spacer()
            Text(layout.signInLayout.subTitleText)
                .font(layout.signInLayout.subTitleFont)
            Spacer(minLength: layout.signInLayout.spacerSize)
            LabeledInputTextView(
                inputText: store.accountID,
                layout: layout.signInLayout.accountIdFieldLayout,
                onSubmitText: { value in
                    store.send(.accountIDInput(value: value))
                }
            )
            LabeledInputPasswordView(
                inputText: store.password,
                layout: layout.signInLayout.passwordFieldLayout,
                onSubmitText: { value in
                    store.send(.passwordInput(value: value))
                }
            )
            Spacer().frame(height: layout.signInLayout.spacerSize)
            GeneralButtonView(
                layout: layout.signInLayout.signInButtonLayout,
                tapAction: {
                    store.send(.signInButtonTapped)
                }
            )
            GeneralButtonView(
                layout: layout.signInLayout.signUpButtonLayout,
                tapAction: {
                    store.send(.modeChange)
                }
            )
            Spacer()
        })
    }

    private var singUp: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Spacer()
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            Text(layout.signUpLayout.titleText)
                .font(layout.signUpLayout.titleFont)
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            LabeledInputTextView(
                inputText: store.accountID,
                layout: layout.signUpLayout.accountIdFieldLayout,
                onSubmitText: { value in
                    store.send(.accountIDInput(value: value))
                }
            )
            LabeledInputPasswordView(
                inputText: store.password,
                layout: layout.signUpLayout.firstPasswordFieldLayout,
                onSubmitText: { value in
                    store.send(.passwordInput(value: value))
                }
            )
            LabeledInputPasswordView(
                inputText: store.passwordConfirm,
                layout: layout.signUpLayout.secondPasswordFieldLayout,
                onSubmitText: { value in
                    store.send(.passwordConfirmInput(value: value))
                }
            )
            LabeledSegmentPickerView(
                selectedKey: store.gender.key,
                items: Gender.toTuple(),
                pickerViewStyle: .segmented,
                layout: LabeledSegmentPickerView.Layout(
                    titleText: "Gender",
                    titleTextColor: .black,
                    titleAlignment: .leading,
                    segmentSelectedTextColor: .black,
                    segmentBackgroundColor: .white,
                    backgroundColor: .clear
                ),
                onSelected: { value in
                    store.send(.genderInput(value: value))
                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            GeneralButtonView(
                layout: layout.signUpLayout.signUpButtonLayout,
                tapAction: {
                    store.send(.signUpButtonTapped)
                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            GeneralButtonView(
                layout: layout.signUpLayout.signInButtonLayout,
                tapAction: {
                    store.send(.modeChange)
                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            Spacer()
            Spacer().frame(height: layout.signUpLayout.spacerSize)
        })
    }
}

// MARK: - Layout
extension SignView {

    struct Layout {

        // MARK: - Properties

        let signInLayout: SignInLayout
        let signUpLayout: SignUpLayout

        // MARK: - Initializer

        public init(
            signInLayout: SignInLayout,
            signUpLayout: SignUpLayout
        ) {
            self.signInLayout = signInLayout
            self.signUpLayout = signUpLayout
        }

    }

    struct SignInLayout {

        // MARK: - Properties

        let titleText: String
        let titleFont: Font
        let subTitleText: String
        let subTitleFont: Font
        let titleSubTitleSpacerSize: CGFloat
        let spacerSize: CGFloat
        let accountIdFieldLayout: LabeledInputTextView.Layout
        let passwordFieldLayout: LabeledInputPasswordView.Layout
        let signInButtonLayout: GeneralButtonView.Layout
        let signUpButtonLayout: GeneralButtonView.Layout

        // MARK: - Initializer

        init(
            titleText: String,
            titleFont: Font = .title,
            subTitleText: String = "",
            subTitleFont: Font = .title2,
            titleSubTitleSpacerSize: CGFloat = 5.0,
            spacerSize: CGFloat = 10.0,
            accountIdFieldLayout: LabeledInputTextView.Layout,
            passwordFieldLayout: LabeledInputPasswordView.Layout,
            signInButtonLayout: GeneralButtonView.Layout,
            signUpButtonLayout: GeneralButtonView.Layout
        ) {
            self.titleText = titleText
            self.titleFont = titleFont
            self.subTitleText = subTitleText
            self.subTitleFont = subTitleFont
            self.titleSubTitleSpacerSize = titleSubTitleSpacerSize
            self.spacerSize = spacerSize
            self.accountIdFieldLayout = accountIdFieldLayout
            self.passwordFieldLayout = passwordFieldLayout
            self.signInButtonLayout = signInButtonLayout
            self.signUpButtonLayout = signUpButtonLayout
        }

        init(
            layout: SignInLayout
        ) {
            self.titleText = layout.titleText
            self.titleFont = layout.titleFont
            self.subTitleText = layout.subTitleText
            self.subTitleFont = layout.subTitleFont
            self.titleSubTitleSpacerSize = layout.titleSubTitleSpacerSize
            self.spacerSize = layout.spacerSize
            self.accountIdFieldLayout = layout.accountIdFieldLayout
            self.passwordFieldLayout = layout.passwordFieldLayout
            self.signInButtonLayout = layout.signInButtonLayout
            self.signUpButtonLayout = layout.signUpButtonLayout
        }

    }

    struct SignUpLayout {

        // MARK: - Property

        let titleText: String
        let titleFont: Font
        let subTitleText: String
        let subTitleFont: Font
        let titleSubTitleSpacerSize: CGFloat
        let spacerSize: CGFloat
        let accountIdFieldLayout: LabeledInputTextView.Layout
        let firstPasswordFieldLayout: LabeledInputPasswordView.Layout
        let secondPasswordFieldLayout: LabeledInputPasswordView.Layout
        let signUpButtonLayout: GeneralButtonView.Layout
        let signInButtonLayout: GeneralButtonView.Layout

        // MARK: - Initializer

        init(
            titleText: String,
            titleFont: Font = .title,
            subTitleText: String = "",
            subTitleFont: Font = .title2,
            titleSubTitleSpacerSize: CGFloat = 5.0,
            spacerSize: CGFloat = 10.0,
            accountIdFieldLayout: LabeledInputTextView.Layout,
            firstPasswordFieldLayout: LabeledInputPasswordView.Layout,
            secondPasswordFieldLayout: LabeledInputPasswordView.Layout,
            signUpButtonLayout: GeneralButtonView.Layout,
            signInButtonLayout: GeneralButtonView.Layout
        ) {
            self.titleText = titleText
            self.titleFont = titleFont
            self.subTitleText = subTitleText
            self.subTitleFont = subTitleFont
            self.titleSubTitleSpacerSize = titleSubTitleSpacerSize
            self.spacerSize = spacerSize
            self.accountIdFieldLayout = accountIdFieldLayout
            self.firstPasswordFieldLayout = firstPasswordFieldLayout
            self.secondPasswordFieldLayout = secondPasswordFieldLayout
            self.signUpButtonLayout = signUpButtonLayout
            self.signInButtonLayout = signInButtonLayout
        }

        init(
            layout: SignUpLayout
        ) {
            self.titleText = layout.titleText
            self.titleFont = layout.titleFont
            self.subTitleText = layout.subTitleText
            self.subTitleFont = layout.subTitleFont
            self.titleSubTitleSpacerSize = layout.titleSubTitleSpacerSize
            self.spacerSize = layout.spacerSize
            self.accountIdFieldLayout = layout.accountIdFieldLayout
            self.firstPasswordFieldLayout = layout.firstPasswordFieldLayout
            self.secondPasswordFieldLayout = layout.secondPasswordFieldLayout
            self.signUpButtonLayout = layout.signUpButtonLayout
            self.signInButtonLayout = layout.signInButtonLayout
        }
    }

}

#Preview {
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
                        hasInputTextDisplayButton: true,
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
                        hasInputTextDisplayButton: true,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                secondPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter your password again.",
                    passwordLayout: GeneralPasswordTextView.Layout(
                        maxLength: 16,
                        hasInputTextDisplayButton: true,
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
