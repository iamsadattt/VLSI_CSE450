# VLSI_CSE450

Design and testing of VLSI circuits — lab work for **CSE 450 (VLSI Design)** at the University of Asia Pacific (UAP).

This repository contains the design files for a full adder, built up from a single-bit cell to a multi-bit adder.

## Repository Structure

```
VLSI_CSE450/
├── Full_Adder_1bit/    # 1-bit full adder design and testing
├── Full_Adder_8bit/    # 8-bit full adder built from 1-bit stages
└── README.md
```

## Projects

### 1. Full Adder (1-bit)

A 1-bit full adder takes three inputs (`A`, `B`, `Cin`) and produces a sum and a carry-out:

| Output | Expression |
|--------|------------|
| Sum    | `A ⊕ B ⊕ Cin` |
| Cout   | `AB + Cin(A ⊕ B)` |

**Truth table**

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

### 2. Full Adder (8-bit)

An 8-bit adder formed by cascading eight 1-bit full adders in a ripple-carry arrangement. The carry-out of each stage feeds the carry-in of the next:

```
A[7:0], B[7:0], Cin  ──►  [FA0]─►[FA1]─► ... ─►[FA7]  ──►  Sum[7:0], Cout
```

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/iamsadattt/VLSI_CSE450.git
   cd VLSI_CSE450
   ```
2. Open the design files in the folder you want (`Full_Adder_1bit` or `Full_Adder_8bit`) using your VLSI/EDA tool.
3. Run the simulation or testbench and compare the results against the truth table above.

> **Tools used:** _add your tool here (e.g. Microwind, LTspice, Cadence, Xilinx Vivado, ModelSim)_

## Author

**Sadat**
GitHub: [@iamsadattt](https://github.com/iamsadattt)

## Acknowledgements

Course: CSE 450 — VLSI Design, University of Asia Pacific.
