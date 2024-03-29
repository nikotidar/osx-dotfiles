# Auto install plug
evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload
plug "andreyorst/plug.kak" noload

# Width of a tab
set-option global tabstop 4

# Indent with 2 spaces
set-option global indentwidth 4

# Use tab for autocompletion
hook global InsertCompletionShow .* %{
    map window insert <tab> <c-n>
    map window insert <s-tab> <c-p>
}

hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# Colorscheme
colorscheme default

# Highlighters and UI
hook global WinCreate .* %{ try %{
  add-highlighter buffer/numbers          number-lines -hlcursor -separator ' '
}}
set-face global LineNumbers rgb:2A3141
set-option global ui_options terminal_assistant=none terminal_padding_char= terminal_set_title=false
add-highlighter global/ wrap -word -indent
add-highlighter global/ show-matching

# Auto save
hook global InsertIdle do %{
 write-all
}

hook global NormalIdle do %{
  write-all
}

# Kak-lsp
try %sh{
kak-lsp --kakoune --session "$kak_session" --config ~/.config/kak-lsp/kak-lsp.toml
}
lsp-enable

lsp-auto-signature-help-enable

# Inlay diagnostics
lsp-inlay-diagnostics-enable global
lsp-inlay-hints-enable global
set-face global InlayHint blue+d
set-face global variable yellow+b
set-face global DiagnosticError red+c
set-face global DiagnosticWarning yellow+dc
set-face global value cyan
set-face global function magenta

# Auto hover options
lsp-auto-hover-enable
set-option global lsp_hover_anchor true
set-option global lsp_hover_max_lines 20

# Semantic highlighting
hook global WinSetOption filetype=.* %{
  hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
  hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
  hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
  hook -once -always window WinSetOption filetype=.* %{
    remove-hooks window semantic-tokens
  }
}

# LSP signs
  set-option global lsp_diagnostic_line_error_sign  ' '
  set-option global lsp_diagnostic_line_hint_sign  ' '
  set-option global lsp_diagnostic_line_info_sign  ' '
  set-option global lsp_diagnostic_line_warning_sign  ' '

# Code actions
set-option global lsp_auto_show_code_actions 'true'

# File search
plug "gustavo-hms/luar" %{
  plug "gustavo-hms/peneira" %{
  	require-module peneira
	}
}

# Auto pairs
plug "alexherbo2/auto-pairs.kak"
enable-auto-pairs

# Clipboard integration
plug "lePerdu/kakboard" %{
	hook global WinCreate .* %{ kakboard-enable }
}

# Surround
plug "h-youhei/kakoune-surround"

# Sudo write
plug "occivink/kakoune-sudo-write"

# Tabs
plug "enricozb/tabs.kak" %{
  set-option global modelinefmt_tabs '%val{cursor_line}:%val{cursor_char_column} | {{mode_info}} '
  set-option global modeline_tabs_percentage 120
  map global normal ^ q
  map global normal <a-^> Q
  map global normal q b
  map global normal Q B
  map global normal <a-q> <a-b>
  map global normal <a-Q> <a-B>

  map global normal b ': enter-user-mode tabs<ret>' -docstring 'tabs'
  map global normal B ': enter-user-mode -lock tabs<ret>' -docstring 'tabs (lock)'
}
set-option global tabs_overlow "shrink"
set-option global tab_separator ''

# Word count
plug "ftonneau/wordcount.kak"

# Livedown
plug 'delapouite/kakoune-livedown'

# Custom keys
map global normal <a-y> ': peneira-files<ret>'
map global normal Y ': w; delete-buffer<ret>'
map global normal <c-q> ': lsp-code-actions<ret>'
map global normal <c-f> ': peneira-lines<ret>'

# Kaktree
plug "andreyorst/kaktree" config %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
        set-option buffer modelinefmt_tabs ''
        set-option buffer modeline_tabs_percentage 0
        set-option global tab_separator ''
    }
    kaktree-enable
}
set-option global kaktree_dir_icon_open  ''
set-option global kaktree_dir_icon_close ''
set-option global kaktree_file_icon      ''
set-option global kaktree_show_help false
set-option global kaktree_size 35
set-option global kaktree_tab_open_file true
set-option global kaktree_hlline true
set-option global kaktree_show_hidden false
kaktree-toggle

# kak-dap
plug "https://codeberg.org/jdugan6240/kak-dap" do %{
  cargo install --locked --force --path .
}

# tmux.kak
plug 'alexherbo2/tmux.kak'
