//
//  WordOfTheDayEntryView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import SwiftUI
import WidgetKit

struct WordOfTheDayWidgetEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var viewModel: WordOfTheDayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text(viewModel.word)
                .modifier(TitleStyle())
            
            VStack(alignment: .leading) {
                Text(LocalizedStringKey("entry_view.definition"))
                    .modifier(SubTitleStyle())
                Text(viewModel.wordDescription)
                    .modifier(BodyStyle())
            }
            
            if case .systemLarge = widgetFamily {
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("entry_view.example"))
                        .modifier(SubTitleStyle())
                    Text(viewModel.wordExample)
                        .modifier(BodyStyle())
                }
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("entry_view.origin"))
                        .modifier(SubTitleStyle())
                    Text(viewModel.origin)
                        .modifier(BodyStyle())
                }
            }
            Spacer()
        }.padding()
    }
}

struct WordOfTheDayWidgetEntryView_Preview: PreviewProvider {
    static var previews: some View {
        return WordOfTheDayWidgetEntryView(
            viewModel: WordOfTheDayViewModel(
                wordOfTheDay: WordOfTheDayWidgetProvider.sampleWordOfTheDay,
                configuration: ConfigurationIntent()
            )
        ).previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
