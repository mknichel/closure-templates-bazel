# closure-templates-bazel

## Overview

This project provides an extension to [Bazel](http://bazel.io) to compile
Google [Closure Templates](https://developers.google.com/closure/templates/)
into JavaScript files.

## Usage

This extension is used in existing BUILD files in your project. For directories
that contain `.soy` files, add the following rule:

```soy_library(
    name = 'my_soy_library',
    srcs = glob(["*.soy"]),
)```

In a terminal, then run the command:

`bazel build //path/to/src:my_soy_library`
