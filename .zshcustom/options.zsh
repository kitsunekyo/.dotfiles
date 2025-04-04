# "If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command
# to that directory."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
#
# That is, enter a path to cd to it
setopt auto_cd

# "Automatically use menu completion after the second consecutive
# request for completion, for example by pressing the tab key
# repeatedly. This option is overridden by MENU_COMPLETE."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
setopt auto_menu

# "Make cd push the old directory onto the directory stack."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt auto_pushd

# "Exchanges the meanings of '+' and '-' when used with a number to
# specify a directory in the stack."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
#
# `cd -3` goes back three directories in the cd stack. I do this because
# `cd -<n>` matches `git checkout @{-<n>}` better than `cd +<n>` does.
setopt pushd_minus

setopt pushd_ignore_dups # dont share duplicates in the stack
setopt pushd_silent # dont print directory stack after pushd and popd


# "If unset, the cursor is set to the end of the word if completion is
# started. Otherwise it stays there and completion is done from both
# ends."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
setopt complete_in_word

# "If the internal history needs to be trimmed to add the current
# command line, setting this option will cause the oldest history
# event that has a duplicate to be lost before losing a unique event
# from the list."
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
setopt hist_expire_dups_first

# "When searching for history entries in the line editor, do not
# display duplicates of a line previously found, even if the
# duplicates are not contiguous."
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
setopt hist_find_no_dups

# "Remove command lines from the history list when the first character
# on the line is a space, or when one of the expanded aliases contains
# a leading space. Only normal aliases (not global or suffix aliases)
# have this behaviour. Note that the command lingers in the internal
# history until the next command is entered before it vanishes,
# allowing you to briefly reuse or edit the line. If you want to make
# it vanish right away without entering another command, type a space
# and press return."
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
setopt hist_ignore_space

# "This option both imports new commands from the history file, and
# also causes your typed commands to be appended to the history file
# (the latter is like specifying INC_APPEND_HISTORY, which should be
# turned off if this option is in effect). The history lines are also
# output with timestamps ala EXTENDED_HISTORY (which makes it easier
# to find the spot where we left off reading the file after it gets
# re-written)."
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
setopt share_history

# "Turns on interactive comments; comments begin with a #."
# https://zsh.sourceforge.io/Intro/intro_16.html
#
# That is, enable comments in the terminal. Nice when copying and
# pasting from documentation/tutorials, and disable part of
# a command pulled up from history.
setopt interactivecomments

# "Beep on an ambiguous completion. More accurately, this forces the
# completion widgets to return status 1 on an ambiguous completion,
# which causes the shell to beep if the option BEEP is also set; this
# may be modified if completion is called from a user-defined widget."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
unsetopt list_beep

# "On an ambiguous completion, instead of listing possibilities or
# beeping, insert the first match immediately. . This option overrides AUTO_MENU."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
#
# Unset to unblock auto_menu
unsetopt menu_complete

# "If set, parameter expansion, command substitution and arithmetic
# expansion are performed in prompts. Substitutions within prompts do
# not affect the command status."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Prompting
setopt prompt_subst
