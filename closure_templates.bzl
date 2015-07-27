# Compiles the provided Soy files into JavaScript files. Each Soy file in the
# srcs attribute will have a corresponding .soy.js file in the output.
#
# This rule expects the SoyToJsSrcCompiler.jar to be provided in a //tools/
# directory in a Bazel filegroup rule called "soy_js_compiler".
#
# Arguments:
#   - name: string, The name of this rule.
#   - srcs: list of string, List of Soy source files.
#   - should_provide_require_soy_namespaces: bool, Whether to output
#     goog.provide and goog.require statements for each namespace in a Soy file.
#     This is useful when used in conjunction with the Closure Library and
#     Closure Compiler. Defaults to True.
#   - visibility: list of string, List of Bazel packages that this rule is
#     visible to.
def soy_library(
    name,
    srcs,
    should_provide_require_soy_namespaces = True,
    visibility=None):

  additional_compiler_args = []
  if should_provide_require_soy_namespaces:
    additional_compiler_args += [
        '--shouldProvideRequireSoyNamespaces']

  native.genrule(
      name = name,
      srcs = srcs,
      outs = [src + '.js' for src in srcs],
      cmd = '$(JAVA) -jar $(location //tools:soy_js_compiler) ' +
            '--srcs $(SRCS) ' +
            '--outputPathFormat $(@D)/{INPUT_FILE_NAME}.js ' +
	    '--shouldGenerateJsdoc ' +
	    '--isUsingIjData ' +
            ' '.join(additional_compiler_args),
      message = 'Compiling templates to JavaScript',
      tools = ["//tools:soy_js_compiler"],
      visibility = visibility,
  )
