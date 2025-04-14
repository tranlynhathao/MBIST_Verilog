# 🧪 MBIST-verilog

A lightweight and modular Built-In Self-Test (MBIST) block for memory systems, designed for FPGA synthesis, extensibility, and educational use.

## 📦 Features

- ✅ Multi-algorithm support: Implement various BIST strategies for memory testing.
- 🔧 Fully synthesizable: Compatible with common FPGA tools like Vivado, Quartus.
- 🧩 Modular and extensible: Easy to integrate or adapt individual modules.
- 🧠 Educational focus: Clean code with clear architecture, great for learning and experimentation.

## 📁 Project Structure

```
.
├── README.md
└── src/
    ├── algorithms/
    │   └── MBIST_algorithm_generator.v       # Generates test patterns (e.g., March, Checkerboard)
    │
    ├── interface/
    │   ├── MBIST_TAP_interface.v             # JTAG-like test interface
    │   └── MBIST_BRAM_SHELL.v                # Interface to internal BRAM
    │
    ├── core/
    │   ├── MBIST_CONTROLLER.v                # Central control FSM
    │   ├── MBIST_comparator_WF.v             # Data comparison logic
    │   └── MBIST_diagnostics.v               # Error reporting & debug
    │
    └── top/
        └── MBIST_BRAM_TOP.v                  # Top-level wrapper for integration
```

## 🚀 Getting Started

You can simulate and synthesize the modules using standard tools.

### 🧪 Simulation (e.g., ModelSim)

```bash
vsim -do simulate.do
```

### ⚙️ FPGA Synthesis (Vivado or Quartus)

Import the `src/` directory and set `MBIST_BRAM_TOP.v` as the top module. Customize or extend based on your memory architecture.

## 📚 References

- [GitHub Repo – Original MBIST reference](https://github.com/NukaCola-Quantum/MBIST-verilog)
- IEEE Standards: 1149.1 (JTAG), 1500 (BIST)
- Xilinx UG – Built-In Self Test Techniques
