/// Install the `deno_dom` polyfill for the JavaScript `DOMParser`, mutating
/// the global scope to add the `DOMParser` object. If running outside of
/// browser you may want to run this at the start of your program.
///
/// Note this will only work on Deno!
///
/// For more information see the documentation:
/// <https://deno.land/x/deno_dom>
@external(javascript, "../javascript_dom_parser_polyfill_ffi.mjs", "installPolyfill")
pub fn install_polyfill() -> Nil
