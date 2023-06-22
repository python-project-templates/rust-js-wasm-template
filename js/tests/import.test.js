import { placeholder, foo} from "../src/js/index";
import { initSync } from "../dist/pkg/rust_js_wasm";
import fs from "fs";


describe("Test", () => {
  beforeAll(async () => {
    const buffer = fs.readFileSync("./dist/pkg/rust_js_wasm_bg.wasm");
    initSync(buffer);
  });

  test("Test1", async () => {
    expect(placeholder).toBeDefined();
  });
  test("Test2", async () => {
    expect(foo()).toBeDefined();
  });
});
