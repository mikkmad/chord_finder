package org.mikmad.chord_finder

import kotlin.test.Test
import kotlin.test.assertEquals

class GreetingUtilTest {

    @Test
    fun testSayHello() {
        val result = sayHello("World")
        assertEquals("Hello, World!", result)
    }
}
