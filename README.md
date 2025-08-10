# Johnson Counter 

Verilog implementation of a Johnson Counter with clear, well-documented code, self-checking testbenches, waveform outputs, and diagrams — perfect for learning and demonstrating digital counter design.

---


## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [How it works (high level)](#how-it-works-high-level)
* [Prerequisites](#prerequisites)
* [Quick start / Run simulation](#quick-start--run-simulation)
* [Directory structure](#directory-structure)
* [Screenshots & diagrams](#screenshots--diagrams)
* [Auto-generate image gallery](#auto-generate-image-gallery)
* [Development tips](#development-tips)
* [CI: run tests on push](#ci-run-tests-on-push)
* [License & Contributing](#license--contributing)

---

## Overview

`Johnson Counter ` is a clean, well-documented Verilog project meant to demonstrate digital design patterns (finite state machines, shift registers, counters, testbenches and waveform analysis). Replace this paragraph with a 2–4 line description of your specific repo: what problem it solves, which modules are important, and what a new visitor should look at first.

---

## Features

* Synthesizable Verilog modules (e.g., FSMs, sequence detectors).
* Self-checking testbenches that generate VCD waveforms.
* Scripts to run simulations and produce waveform files.
* Clear directory layout and a gallery of diagrams/screenshots.

---

## How it works 
Johnson Counter
A Johnson counter (also called a twisted ring counter) is a special type of shift register counter that cycles through 2 × n unique states using n flip-flops.

    It works by shifting bits from one flip-flop to the next on each clock pulse.

    The inverted output of the last flip-flop is fed back into the first flip-flop’s input.

    This feedback pattern produces a predictable sequence of bit patterns that can be used for counting, timing, or generating control signals.

For example, a 4-bit Johnson counter cycles like this:

0000 → 1000 → 1100 → 1110 → 1111 → 0111 → 0011 → 0001 → (repeats)

Johnson counters are often used in:

    LED chasing light patterns

    Timing signal generation

    Simple digital frequency dividers

## Prerequisites

Tested on Ubuntu (Linux). You'll typically need:

* `iverilog` (simulator)
* `vvp` (comes with iverilog)
* `gtkwave` (waveform viewer)
* `git` and optionally `gh` (GitHub CLI) or access to GitHub web UI
* `ffmpeg` (optional — for turning screenshots into GIFs)

Install (Ubuntu):

```bash
sudo apt update
sudo apt install -y iverilog gtkwave git ffmpeg
```

---

## Quick start / Run simulation

Example: simulate `johnson_counter` (replace filenames with those in your repo):

```bash
# from repo root
# compile TB and DUT
iverilog -o build/johnson_tb.vvp tb/johnson_tb.v src/johnson_counter.v
# run simulation
vvp build/johnson_tb.vvp
# open VCD in GTKWAVE
gtkwave build/dump.vcd
```

If your testbench uses `$dumpfile("build/dump.vcd");` and `$dumpvars(0, tb_name);` you'll get `build/dump.vcd` automatically.

---


## Screenshots & diagrams
<img width="1536" height="1024" alt="diagram" src="https://github.com/user-attachments/assets/5de740d0-da11-4540-8e60-a7c07d221f5a" />
<img width="1158" height="768" alt="schematic " src="https://github.com/user-attachments/assets/4bd88e98-6d66-4fb0-8958-278e3dac236b" />
<img width="1158" height="768" alt="detailed_schematic" src="https://github.com/user-attachments/assets/7c7c826d-cde1-481b-b4ac-7f80f481b267" />






## Development tips

* Keep simulations and build artefacts out of version control (see `.gitignore` below).
* Include self-checking assertions in testbenches where possible (e.g., `$display` and `$finish` on failure/passed).
* Provide small, focused testbenches per module so CI can run them fast.

### Useful .gitignore (start with this)

```
# build artifacts
/build/
*.vvp
*.vcd
*.wlf
*.log

# editor files
*.swp
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

---

## CI: run tests on push (GitHub Actions snippet)

Create `.github/workflows/iverilog.yml` to run basic simulations on push:

```yaml
name: Icarus Verilog CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install packages
        run: sudo apt-get update && sudo apt-get install -y iverilog gtkwave
      - name: Compile & run tests
        run: |
          iverilog -o build/test_all.vvp tb/test_all.v src/*.v
          vvp build/test_all.vvp
```

This ensures push/PRs run the simulation quickly and catch regressions.

---

## Contributing

If you want to accept contributions:

* Add `CONTRIBUTING.md` describing the development workflow.
* Use small PRs; include testbench changes and waveform examples.


---

