//// Bindings to the JavaScript `DOMParser` API, to enable parsing of HTML in
//// the browser with Gleam. And any other JavaScript runtimes that have
//// `DOMParser`.
////

pub type HtmlNode {
  Element(
    /// The tag of the element, written in uppercase. For example:
    ///
    /// ```html
    /// <div>Hello!</div>
    /// ```
    ///
    /// Would have the tag `"DIV"`.
    ///
    tag: String,
    /// The attributes of the element. For example:
    ///
    /// ```html
    /// <div class="greeting">Hello!</div>
    /// ```
    ///
    /// Would have the attributes `[#("class", "greeting")]`.
    ///
    attributes: List(#(String, String)),
    /// The children of the element.
    ///
    children: List(HtmlNode),
  )
  Text(String)
  Comment(String)
}

/// A reference to a node in a DOM tree, parsed from some HTML.
pub type Dom

/// Parse HTML to the DOM using the JavaScript `DOMParser`. Any invalid HTML
/// will be converted into a valid document with a similar structure rather
/// than returning an error or crashing.
/// 
/// For more information see JavaScript documentation for the `DOMParser`:
/// <https://developer.mozilla.org/en-US/docs/Web/API/DOMParser>
///
@external(javascript, "./javascript_dom_parser_ffi.mjs", "parse")
pub fn parse_to_dom(html: String) -> Dom

/// Parse HTML to Gleam records using the JavaScript `DOMParser`. Any invalid
/// HTML will be converted into a valid document with a similar structure
/// rather than returning an error or crashing.
/// 
/// For more information see JavaScript documentation for the `DOMParser`:
/// <https://developer.mozilla.org/en-US/docs/Web/API/DOMParser>
///
pub fn parse_to_records(html: String) -> HtmlNode {
  html
  |> parse_to_dom
  |> dom_to_records
}

/// Convert from JavaScript DOM to Gleam records representing the same
/// document.
///
@external(javascript, "./javascript_dom_parser_ffi.mjs", "toRecords")
pub fn dom_to_records(html: Dom) -> HtmlNode

/// Convert DOM into HTML.
///
@external(javascript, "./javascript_dom_parser_ffi.mjs", "toString")
pub fn dom_to_string(element: Dom) -> String
