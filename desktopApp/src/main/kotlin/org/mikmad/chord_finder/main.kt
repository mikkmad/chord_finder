package org.mikmad.chord_finder

import androidx.compose.ui.window.Window
import androidx.compose.ui.window.application

fun main() = application {
    Window(
        onCloseRequest = ::exitApplication,
        title = "chord_finder",
    ) {
        App()
    }
}