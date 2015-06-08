Vim Config

	Stolen from the best! (github/hjep/dotfiles, github/argaen/.vim)

	Add some setup info here...

Notes on Common and Uncommon Commands

:set number - Turn on line numbering
:set nonumber - Turn off line numbering

Spelling

  Use 'z' + '=' over misspelt word to see suggested words

Mapping

 :map - Normal, Insert, Visual and Command-line modes
 :imap - Insert mode only
 :cmap - Command-line mode only
 :nmap - Normal mode only
 :vmap - Visual mode only

Movement

 ( - Beginning of sentence
 ) - End of sentence

 { - Beginning of paragraph 
 } - End of paragraph

 g, - Move to previous edit
 g; - Move to forward edit

Programming 

 % - In programming language, jump to parts of block
 
 [[ and ][ - Move backwards/forwards to the next section beginning (start of function)
 [] and ]] - Move backwards/forwards to the next section end (end of function)

 [{ - Move to beginning of current block
 ]G} - Move to end of current block

 [/ - Move to beginning of comment block
 ]/ - Move to end of comment block

 gd - (when above variable) Goto Declaration of variable
 gD - (when above variable) Goto global Declaration of variable

Buffers

 :buffers - Show list of current buffers
 :buffer N - Goto buffer B
 :bnext - Goto next buffer
 :bprevious - Goto previous buffer

 Ctrl + 6 - Toggle between current/previous buffer

Navigation

 gf - Open filename under cursor

Searching

 ? - Search backwards
 / - Search forwards
 n - search again
 N - Reverse search
 ?? - Repeat backwards search
 // - Repeat forwards search
 
 # - Search for previous occurrence of word under cursor
 * - Search for future occurrence of word under cursor
 
 g# - Search for previous occurence of part of word under cursor
 g* - Search for future occurence of part of word under cursor

 :vimgrep /pattern/[j][g] file file2... fileN
	- Search through multiple files for pattern. If 'g' show a line for
	  each pattern match. If 'j' results will be added to 'quickfix' list.
	  Use ** to search recursively through all subdirectories.

 :clist - Show quickfix results
 :cnext - Navigate to next match
 :cprevious - Navigate to previous match 

 
Help

  :helpgrep pattern - Search help for pattern

Markers

  'm' + single alphanum char - Mark current line with mark of alphanum character
  '+' + alphanum char - Jump to the same mark line
  '`' + alphanum char - Jump to exact cursor position + line of mark

  Alphanum char - 0-9 - Reserved for Vim
		  a-z - Marks in current file
		  A-Z - Mark available across files

  :delmarks a f-i - Delete marks 'a', 'f' to 'i'

  :delmarks! - Delete all current marks in buffer

Autocomplete

  Ctrl + 'n' - Autocomplete word with matching future word in file
  Ctrl + 'p' - Autocomplete word with matching previous word in file

  Ctrl 'x' + Ctrl 'k' - Autocomplete current word from dictionary

Macros

  qa - Record from now into into register a
  q - Stop recording
  @a - Execute recording register a
  15@a - Excute recording in register a 15 times
  @@ - Repeat last executed command

Views / Sessions

  :mkview [file] - Save current view to file
  :mksession [file] - Save current views to a file
  :source Session.vim - Load session
  :loadview View.vim

Registers

  :registers - List current registers
  "x y/x/d - Yank/cut/delete text into register x
  "x p/P - Put after or before cursor text from register x

Undo

  :undolist - See undolist
  :undo N - Go to change number N

  :earlier Ns/Nm/Nh
  :later Ns/Nm/Nh

Folding

  zo - Open a fold
  zc - Close a fold
  zM - Close all folds
  zR - Open all folds


Network Write

  :Nwrite scp://user@hostname/filepath

Indent

  p=`] - Paste and indent lines

Tabs

  gt - Goto next tab
  gT - Goto previous tab
  :tabs - List tabs
  {i}gt - Goto tab number i
  :tabopen [FILE]
  :tabclose - Close current tab
  :tabonly - Close all but current tab
