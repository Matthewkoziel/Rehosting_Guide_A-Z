# Screen Quick Reference

## Purpose

screen command in Linux provides the ability to launch and use multiple shell sessions from a single ssh session. When a process is started with ‘screen’, the process can be detached from session & then can reattach the session at a later time. When the session is detached, the process that was originally started from the screen is still running and managed by the screen itself. The process can then re-attach the session at a later time, and the terminals are still there, the way it was left.

HiDB Loads...

## Basic

| Command                    | Description                           |
|----------------------------|---------------------------------------|
| `screen -S <session-name>` | Start a new session with session name |
| `screen -ls`               | List running sessions / screens       |
| `screen -x`                | Attach to a running session           |
| `screen -r <session-name>` | Attach to a running session with name |
| `screen -d <session-name>` | Detach a running session              |

## Scripting

| Command                                 | Description                       |
|-----------------------------------------|-----------------------------------|
| `screen -S <session-name> -X <command>` | Send a command to a named session |

## Escape Key

All screen commands are prefixed by an escape key, by default __Ctrl-a__ (that's Control-a, sometimes written ^a).

## Getting Out

| Command                                                | Description                    |
|--------------------------------------------------------|--------------------------------|
| `Ctrl-a d`                                             | Detach                         |
| `Ctrl-a D D`                                           | Detach and logout (quick exit) |
| `Ctrl-a :` quit or exit all of the programs in screen. | Exit screen                    |
| `Ctrl-a C-\` (not recommended)                         | Force-exit screen              |

## Help

| Command                        | Description |
|--------------------------------|-------------|
| `Ctrl-a ?` (Lists keybindings) | See help    |

## Window Management

| Command                                                          | Description                          |
|------------------------------------------------------------------|--------------------------------------|
| `Ctrl-a c`                                                       | Create new window                    |
| `Ctrl-a Ctrl-a` (commonly used to flip-flop between two windows) | Change to last-visited active window |
| `Ctrl-a <number>` (only for windows 0 to 9)                      | Change to window by number           |
| `Ctrl-a ' <number or title>`                                     | Change to window by number or name   |
| `Ctrl-a n` or `Ctrl-a <space>`                                   | Change to next window in list        |
| `Ctrl-a p` or `Ctrl-a <backspace>`                               | Change to previous window in list    |
| `Ctrl-a "` (allows you to select a window to change to)          | See window list                      |
| `Ctrl-a w` (if you don't have window bar)                        | Show window bar                      |
| `Ctrl-a k` (not recommended)                                     | Kill current window                  |
| `Ctrl-a \` (not recommended)                                     | Kill all windows                     |
| `Ctrl-a A`                                                       | Rename current window                |

## Split screen

| Command      | Description                            |
|--------------|----------------------------------------|
| `Ctrl-a S`   | Split display horizontally             |
| `Ctrl-a`     | Split display vertically               |
| `Ctrl-a tab` | Jump to next display region            |
| `Ctrl-a X`   | Remove current region                  |
| `Ctrl-a Q`   | Remove all regions but the current one |

## Misc

| Command                                                                | Description                                        |
|------------------------------------------------------------------------|----------------------------------------------------|
| `Ctrl-a C-l`                                                           | Redraw window                                      |
| `Ctrl-a [` or `Ctrl-a <esc>` (also used for viewing scrollback buffer) | Enter copy mode                                    |
| `Ctrl-a ]`                                                             | Paste                                              |
| `Ctrl-a M`                                                             | Monitor window for activity                        |
| `Ctrl-a _`                                                             | Monitor window for silence                         |
| `Ctrl-a Ctrl-v`                                                        | Enter digraph (for producing non-ASCII characters) |
| `Ctrl-a x`                                                             | Lock (password protect) display                    |
| `Ctrl-a :`                                                             | Enter screen command                               |
| `Ctrl-a H`                                                             | Enable logging in the screen session               |

***
## Examples