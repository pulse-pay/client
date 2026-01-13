import SwiftUI

struct SearchView: View {

    @State private var searchText = ""

    private let destinations = SearchDestination.allCases

    var filteredResults: [SearchDestination] {
        guard !searchText.isEmpty else { return [] }
        return destinations.filter {
            $0.rawValue.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {

                AppColors.darkBG
                    .ignoresSafeArea()

                VStack(spacing: 20) {

                    // 🔍 SEARCH BAR
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(AppColors.textMutedOnDark)

                        TextField("Search services, usage, history…", text: $searchText)
                            .foregroundColor(AppColors.textOnDark)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)

                        if !searchText.isEmpty {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(AppColors.textMutedOnDark)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // 📂 CONTENT
                    ScrollView {
                        VStack(spacing: 20) {

                            // EMPTY STATE
                            if searchText.isEmpty {
                                VStack(spacing: 12) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 36))
                                        .foregroundColor(AppColors.textMutedOnDark)

                                    Text("Search across PulsePay")
                                        .font(.headline)
                                        .foregroundColor(AppColors.textOnDark)

                                    Text("Find services, usage, or history")
                                        .font(.caption)
                                        .foregroundColor(AppColors.textMutedOnDark)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.top, 60)
                            }

                            // RESULTS
                            else if !filteredResults.isEmpty {
                                VStack(spacing: 12) {
                                    ForEach(filteredResults) { item in
                                        NavigationLink {
                                            item.destinationView
                                        } label: {
                                            SearchRow(title: item.rawValue)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            }

                            // NO RESULTS
                            else {
                                VStack(spacing: 12) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 32))
                                        .foregroundColor(AppColors.textMutedOnDark)

                                    Text("No results found")
                                        .foregroundColor(AppColors.textMutedOnDark)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.top, 40)
                            }

                            Spacer(minLength: 40)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
