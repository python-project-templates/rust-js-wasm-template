use pyo3::prelude::*;

#[pyfunction]
fn double(x: usize) -> usize {
    x * 2
}

#[pymodule]
fn rust_js_wasm(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(double, m)?)?;
    Ok(())
}
