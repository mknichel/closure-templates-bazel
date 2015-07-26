# closure-templates-bazel

## Overview

This project provides an extension to [Bazel](http://bazel.io) to compile
Google [Closure Templates](https://developers.google.com/closure/templates/)
files into JavaScript files.

## Usage

This extension is used in existing BUILD files in your project. For directories
that contain `.soy` files, add the following rule:

```
load("//path/to/closure_templates", "soy_library")

soy_library(
    name = 'my_soy_library',
    srcs = glob(["*.soy"]),
)
```

In a terminal, then run the command:

`bazel build //path/to/src:my_soy_library`

This will generate a `.soy.js` file for every Soy source file in that directory.

## Setting up a project to use this Bazel extension

1. Set up Bazel by following the instructions on the [Getting Started](http://bazel.io/docs/getting-started.html) page
2. Put a copy of the SoyToJsSrcCompiler.jar in a tools/ directory in your project.
3. Put the closure_templates.bzl file somewhere in your project. Every BUILD file that uses Soy will need to load this .bzl file at that path.
4. Follow Usage instructions.

## Running the demo in this project

To test out this extension using this project, follow these instructions:

1. Run `git clone https://github.com/mknichel/closure-templates-bazel.git`
2. Set up Bazel by following the instructions on the [Getting Started](http://bazel.io/docs/getting-started.html) page
3. Run `bazel build //demo:demo_soy`
4. Examine the output in bazel-genfiles/demo/demo.soy.js
