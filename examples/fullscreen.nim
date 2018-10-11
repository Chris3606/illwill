# Simple example that prints out the size of the terminal window and
# demonstrates the basic structure of a full-screen app

import illwill
import math, os, strformat, times


proc exitProc() {.noconv.} =
  illwillDeinit()
  quit(0)

proc main() =
  illwillInit(fullscreen=true)
  setControlCHook(exitProc)
  hideCursor()

  while true:
    var tb = newTerminalBuffer(terminalWidth(), terminalHeight())

    var key = getKey()
    case key
    of Key.Escape, Key.Q: exitProc(); break
    else: discard

    tb.setForegroundColor(fgYellow)
    tb.drawRect(0, 0, tb.width-1, tb.height-1)

    tb.setBackgroundColor(bgRed)
    tb.setForegroundColor(fgWhite, bright=true)
    tb.write(1, 1, fmt"Width:  {tb.width}")
    tb.write(1, 2, fmt"Height: {tb.height}")

    tb.resetAttributes()
    tb.setForegroundColor(fgGreen)
    tb.drawRect(4, 4, 12, 6, doubleStyle=true)

    tb.display()

    sleep(20)

main()

