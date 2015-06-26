# batch_rename

This gem provides a CLI command:

> `batch-rename`

to **bulk rename files** in OS&nbsp;X using an interactive text editor.


## Background

This gem was inspired by a question from StackExchange user [Yuriy Babenko](http://apple.stackexchange.com/users/71676) in June 2015 where he asked whether there was [an OS&nbsp;X app/way to batch rename files via a purely text interface](http://apple.stackexchange.com/questions/192984).


## System requirements

* This gem has been tested on **OS&nbsp;X Yosemite only.**  
It should be trivial though to make it work on Windows, Linux, or OS&nbsp;X pre-Yosemite. PRs are welcome!

* The gem **depends on DiffMerge** to be installed, a visual diff editor developed by SourceGear. See the next section for details.


## Installation

1. First, make sure you have [DiffMerge](https://sourcegear.com/diffmerge) installed. You can either download it from [SourceGear’s website](https://sourcegear.com/diffmerge/downloads.php) or via [Homebrew Cask](http://caskroom.io) (`brew cask install diffmerge`).

2. Install the gem:

```sh
gem install batch_rename
```


## Usage

1. Open Terminal.app.

2. `cd` to the directory whose content you want to rename.

3. Enter the command:

```sh
batch-rename
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/claui/batch_rename.


## Credits

The idea for batch_rename was taken from [a question](http://apple.stackexchange.com/questions/192984) by Yuriy Babenko on apple.stackexchange.com.


## Legal notice

This gem depends on the software DiffMerge to be installed, a product from [SourceGear, LLC](https://sourcegear.com).  
SourceGear, LLC has no connection to batch_rename or to its author whatsoever. In particular, they do not endorse batch_rename or its usage.

A separate [license agreement for DiffMerge](https://sourcegear.com/diffmerge/webhelp/chapter_sourcegearlicenseagreement.html) can be found on SourceGear’s website.


## License

Copyright (c) 2015, Claudia Pellegrino

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
