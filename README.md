# Dictate — a local SuperWhisper clone (Windows)

Press **Ctrl+Space**, talk, press **Ctrl+Space** again → your words get typed into
whatever app has focus. Speech-to-text runs **100% on your own machine** (no
subscription, works offline). An optional AI pass cleans up rambling and fixes
misheard words before it pastes.

- **Ctrl+Space** — start / stop + paste
- **Esc** — cancel the current recording
- A small capsule shows on screen while you dictate, then hides itself.

## Requirements

- **Windows**
- **Python 3.12** — install from https://www.python.org/downloads/ (keep the default
  "Install for me only" location, and tick **Add python.exe to PATH**)
- A **microphone**

## Setup

1. Download this folder (green **Code** button → Download ZIP, then unzip — or
   `git clone`).
2. Open a terminal in the folder and install the dependencies:
   ```
   py -m pip install -r requirements.txt
   ```
   The speech model (~330 MB) downloads by itself the first time you run it.
3. **(Optional but recommended) turn on the AI cleanup:** get an API key at
   https://console.anthropic.com/ , then copy `api-key.txt.example` to
   **`api-key.txt`** and paste your key inside. No key? It still works — it just
   pastes the raw transcript.

## Run it

```
py dictate.py
```

Then press **Ctrl+Space** anywhere and start talking.

### Start it automatically at login (optional)

Press **Win+R**, type `shell:startup`, Enter — then drop a copy of
**`run-dictate.vbs`** into that folder. It launches the app hidden every time you
log in. (Double-click `run-dictate.vbs` any time to (re)start it without a
console window.)

## What the AI cleanup does

If you added a key, your dictation is rewritten by Claude Haiku before pasting:
rambling gets restructured into clear sentences (your own words kept — nothing is
dumbed down), filler words dropped, and obviously-misheard words fixed from
context. It costs roughly a fraction of a cent per dictation. Short phrases
(1–2 words) skip the AI and paste instantly.

## Notes / troubleshooting

- **Nothing pastes into an admin window?** Windows blocks simulated keystrokes into
  elevated apps — run those as normal, or run this app as admin too.
- **Want more accuracy?** In `dictate.py`, change `MODEL = "distil-small.en"` to
  `"small.en"` or `"distil-large-v3"` (slower, more accurate).
- **Auto-stops** after 5 minutes if you leave the mic on.
- Logs go to `dictate.log` next to the script.

## Privacy

Your voice never leaves your computer for transcription — the Whisper model runs
locally. Only the final **text** is sent to Anthropic, and only if you added an API
key for the optional cleanup. Your `api-key.txt` stays on your machine (it's
git-ignored).
