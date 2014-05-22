homebrew Cookbook CHANGELOG
===========================
This file is used to list changes made in each version of the homebrew cookbook.


v1.6.4 (2014-05-08)
-------------------
- Fixing cask provider correctly this time. "brew cask list"


v1.6.2 (2014-05-08)
-------------------
- Fixing typo in cask provider: 's/brew brew/brew/'


v1.6.0 (2014-04-23)
-------------------
- [COOK-3960] Added LWRP for brew cask
- [COOK-4508] Add ChefSpec matchers for homebrew_tap
- [COOK-4566] Guard against "HEAD only" formulae


v1.5.4
------
- [COOK-4023] Fix installer script's URL.
- Fixing up style for rubocop


v1.5.2
------
- [COOK-3825] setting $HOME on homebrew_package


v1.5.0
------
### Bug
- **[COOK-3589](https://tickets.opscode.com/browse/COOK-3589)** - Add homebrew as the default package manager on OS X Server

v1.4.0
------
### Bug
- **[COOK-3283](https://tickets.opscode.com/browse/COOK-3283)** - Support running homebrew cookbook as root user, with sudo, or a non-privileged user

v1.3.2
------
- [COOK-1793] - use homebrew "go" script to install homebrew
- [COOK-1821] - Discovered version using Homebrew Formula factory fails check that verifies that version is a String
- [COOK-1843] - Homebrew README.md contains non-ASCII characters, triggering same issue as COOK-522

v1.3.0
------
- [COOK-1425] - use new json output format for formula
- [COOK-1578] - Use shell_out! instead of popen4

v1.2.0
------
Opscode has taken maintenance of this cookbook as the original author has other commitments. This is the initial release with Opscode as maintainer.

Changes in this release:

- [pull/2] - support for option passing to brew
- [pull/3] - add brew upgrade and control return value from command
- [pull/9] - added LWRP for "brew tap"
- README is now markdown, not rdoc.
