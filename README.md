# javascript_dom_parser

Bindings to the JavaScript `DOMParser` API.

[![Package Version](https://img.shields.io/hexpm/v/javascript_dom_parser)](https://hex.pm/packages/javascript_dom_parser)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/javascript_dom_parser/)

```sh
gleam add javascript_dom_parser
```
```gleam
import javascript_dom_parser

pub fn main() {
  let html = "
<!doctype html>
<html lang=en>
<head>
  <title>Hi!</title>
</head>
<body>
  <p style='color: #ffaff3'>How are you?</p>
  <!-- Wooo coding! -->
</body>
</html>
"
  javascript_dom_parser.parse_to_records(html)
}
```
This function will return a data structure like so:
```gleam
Element("HTML", [#("lang", "en")], [
  Element("HEAD", [], [
    Text("\n  "),
    Element("TITLE", [], [Text("Hi!")]),
    Text("\n"),
  ]),
  Text("\n"),
  Element("BODY", [], [
    Text("\n  "),
    Element("P", [#("style", "color: #ffaff3")], [Text("How are you?")]),
    Text("\n  "),
    Comment(" Wooo coding! "),
    Text("\n\n"),
  ]),
])
```

Further documentation can be found at <https://hexdocs.pm/javascript_dom_parser>.
