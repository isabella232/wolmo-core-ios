## WolMo - Core iOS
[![Build Status](https://travis-ci.org/Wolox/wolmo-core-ios.svg?branch=master)](https://travis-ci.org/Wolox/wolmo-core-ios)
[![Coverage Status](https://coveralls.io/repos/github/Wolox/wolmo-core-ios/badge.svg?branch=master)](https://coveralls.io/github/Wolox/wolmo-core-ios?branch=master)
![Swift 2.2.x](https://img.shields.io/badge/Swift-2.2.x-orange.svg)

WolMo - Core iOS is a framework which provides extensions and utilities for iOS commonly used at [Wolox](http://www.wolox.com.ar/).


## Table of Contents

  * [Installation](#installation)
  	* [Carthage](#carthage)
  	* [Manually](#manually)
  * [Bootstrap](#bootstrap) 
  * [Contributing](#usage)
  * [About](#about)
  * [License](#license)

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with Homebrew using the following command:

```
brew update
brew install carthage
```
To download wolmo-core-iOS, add this to your Cartfile:
```
github "Wolox/wolmo-core-ios" ~> 0.1.0
```

### Manually
[Bootstrap](#bootstrap) the project and then drag it to your workspace.

## Bootstrap
```
git clone git@github.com:Wolox/wolmo-core-ios.git
cd wolmo-core-ios
script/bootstrap
```

## Contributing
1. Fork it
2. [Bootstrap](#bootstrap) using the forked repository (instead of `Wolox/wolmo-core-ios.git`, `your-user/wolmo-core-ios.git`)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Run tests (`./script/test`)
6. Push your branch (`git push origin my-new-feature`)
7. Create a new Pull Request

## About

This project is maintained by [Francisco Depascuali](https://github.com/FranDepascuali) and it is written by [Wolox](http://www.wolox.com.ar).

![Wolox](https://raw.githubusercontent.com/Wolox/press-kit/master/logos/logo_banner.png)

## License
**WolMo - Core iOS** is available under the MIT [license](LICENSE.txt).

    Copyright (c) 2016 Francisco Depascuali <francisco.depascuali@wolox.com.ar>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
