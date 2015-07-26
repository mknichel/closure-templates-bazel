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
