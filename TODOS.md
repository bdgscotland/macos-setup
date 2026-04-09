# TODOs

## Deferred from v1

### Weekly automated drift report
**What:** Run `bin/audit` on a schedule via launchd, write results to a log, optionally notify via terminal-notifier.
**Why:** Makes the system feel alive. Catches manual installs that drift from repo spec without remembering to run audit manually.
**Effort:** M (human) / S (CC)
**Priority:** P3
**Depends on:** bin/audit being stable and tested on multiple runs.

### Machine-to-machine diff command
**What:** `bin/diff <machine-a> <machine-b>` compares two machine profiles from `machines/*.toml` and shows what's different (packages, language versions, config).
**Why:** When you have 2+ machines, you want to know exactly how they differ. Useful for debugging "it works on my other Mac."
**Effort:** M (human) / S (CC)
**Priority:** P3
**Depends on:** At least 2 machines captured in `machines/`.

### Auto-generated GitHub Pages docs site
**What:** A static site auto-generated from the repo showing the complete stack: every brew package with link, every macOS default with explanation, every config with annotations.
**Why:** The "whoa" factor for the open-source audience. Makes the repo look professional and browsable.
**Effort:** L (human) / M (CC)
**Priority:** P2
**Depends on:** Core repo being stable and documented.

### Mac App Store apps via `mas`
**What:** Decide whether to include `mas` (Mac App Store CLI) in the Brewfile and track App Store apps.
**Why:** Some apps are only available via the App Store.
**Context:** `mas` is already installed. Reliability of `mas` CLI varies across macOS versions. Investigate before committing.
**Priority:** P3
