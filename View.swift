struct SignInWithApple_View: View {
	var body: some View {
		SignInWithAppleButton(
			onRequest: { request in
				request.requestedScopes = [.fullName, .email]
			},
			onCompletion: { result in
				switch result {
				case .success (let authResults):
					print("Authorization successful.")
					Task {
						do {
							print(authResults)
						} catch {
							print("Error", error)
						}
					}
				case .failure (let error):
					print("Authorization failed: " + error.localizedDescription)
				}
			}
		)
	}
