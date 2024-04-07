import { DOMParser } from "https://deno.land/x/deno_dom/deno-dom-wasm.ts";

export function installPolyfill() {
  globalThis.DOMParser = DOMParser;
}
