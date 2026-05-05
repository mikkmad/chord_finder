package org.mikkmad.chordfinder

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform