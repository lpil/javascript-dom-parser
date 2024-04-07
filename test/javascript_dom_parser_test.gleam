import birdie
import gleeunit
import javascript_dom_parser
import javascript_dom_parser/deno_polyfill
import pprint

pub fn main() {
  deno_polyfill.install_polyfill()
  gleeunit.main()
}

pub fn dom_empty_test() {
  javascript_dom_parser.parse_to_dom("")
  |> javascript_dom_parser.dom_to_string
  |> birdie.snap("dom_empty_test")
}

pub fn dom_invalid_test() {
  javascript_dom_parser.parse_to_dom("Invalid: <div")
  |> javascript_dom_parser.dom_to_string
  |> birdie.snap("dom_invalid_test")
}

pub fn dom_some_things_test() {
  javascript_dom_parser.parse_to_dom(
    "
  <h1>Hello, Joe!</h1>
  <h2>BEAM languages:<h2>
  <ul>
    <li>Erlang
    <li>LFE
    <li>Elixir
    <li>Gleam
  <ul>
  ",
  )
  |> javascript_dom_parser.dom_to_string
  |> birdie.snap("dom_some_things_test")
}

pub fn dom_comments_test() {
  javascript_dom_parser.parse_to_dom(
    "
  <h1>Hello, Joe!</h1>
  <!-- Joe is really cool -->
  ",
  )
  |> javascript_dom_parser.dom_to_string
  |> birdie.snap("dom_comments_test")
}

pub fn records_empty_test() {
  javascript_dom_parser.parse_to_records("")
  |> pprint.format
  |> birdie.snap("records_empty_test")
}

pub fn records_page_test() {
  javascript_dom_parser.parse_to_records(
    "
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
",
  )
  |> pprint.format
  |> birdie.snap("records_page_test")
}
