# Kakoune default++ color scheme

# For Code
face global value red
face global type yellow
face global variable yellow
face global module cyan
face global function magenta
face global string green
face global keyword magenta
face global operator yellow
face global attribute green
face global comment blue
face global documentation comment
face global meta magenta
face global builtin default+b

# For markup
face global title blue
face global header cyan
face global mono green
face global block magenta
face global link cyan
face global bullet cyan
face global list yellow

# builtin faces
face global Default default
face global PrimarySelection white,blue+fg
face global SecondarySelection white,black+fg
face global PrimaryCursor black,bright-green+fg
face global SecondaryCursor black,bright-yellow+fg
face global PrimaryCursorEol black,red+fg
face global SecondaryCursorEol black,bright-red+fg
face global LineNumbers blue
face global LineNumbersWrapped cyan+di
face global LineNumberCursor yellow
face global MenuForeground black,blue
face global MenuBackground blue,black
face global MenuInfo cyan
face global Information default,black
face global Error black,red
face global StatusLine cyan,default+b
face global StatusLineMode yellow,default
face global StatusLineInfo blue,default
face global StatusLineValue green,default
face global StatusCursor black,cyan
face global Prompt yellow,default
face global MatchingChar default,default+b
face global Whitespace rgb:5c5c5c,default+f
face global BufferPadding blue,default

# LSP diagnostics
face global InlayDiagnosticError red+difg
face global InlayDiagnosticWarning yellow+difg
