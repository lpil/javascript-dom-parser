import { List, NonEmpty, Empty } from "./gleam.mjs";
import { Text, Element, Comment } from "./javascript_dom_parser.mjs";

export function parse(html) {
  return new DOMParser().parseFromString(html, "text/html").documentElement;
}

export function toString(element) {
  return element.outerHTML;
}

export function toRecords(element) {
  switch (element.nodeType) {
    case element.ELEMENT_NODE:
      const children = List.fromArray(
        Array.from(element.childNodes).map(toRecords),
      );
      return new Element(element.tagName, attributes(element), children);

    case element.TEXT_NODE:
      return new Text(element.textContent);

    case element.COMMENT_NODE:
      return new Comment(element.textContent);

    default:
      throw new Error("Unexpected node " + element);
  }
}

export function attributes(element) {
  let attributes = new Empty();
  for (const attribute of element.attributes) {
    attributes = new NonEmpty([attribute.name, attribute.value], attributes);
  }
  return attributes;
}

export function tag(element) {
  return element.tagName;
}

export function childNodes(element) {
  return List.fromArray(element.childNodes);
}
