import "../css/index.css";

import * as wasm from "../../dist/pkg/rust_js_wasm";

export * as wasm from "../../dist/pkg/rust_js_wasm";

export const placeholder = "";

export const foo = () => wasm.foo();
