package org.mikmad.chord_finder

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform