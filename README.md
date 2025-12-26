# FPGA Workspace

This repository contains multiple FPGA design projects developed and simulated using **Xilinx Vivado**.

The goal of this workspace is to organize, version-control, and document FPGA experiments and learning projects in a clean and reusable way.

---

## 📁 Workspace Structure

```text
fpga_workspace/
│── blink_led/
│── traffic_light/
│── Basys-3-Master.xdc
│── .gitignore
│── README.md
```

Each folder corresponds to an **independent Vivado project**.

---

## 🧰 Tools & Environment

- **FPGA Toolchain**: Xilinx Vivado  
- **Target Board**: Basys 3 (Artix-7)  
- **HDL Language**: Verilog / VHDL 
- **Operating System**: Windows  

---

## 📌 Projects Overview

### 1️⃣ [Blink LED](./blink_led/)
**Description:**  
Simple design to blink an LED at a fixed frequency.

**Key concepts:**
- Clock division
- Basic output control

**Status:** ✅ Completed 

---

### 2️⃣ [Traffic Light Controller](./traffic_light/)
**Description:**  
Finite State Machine (FSM) controlling traffic lights.

**Key concepts:**
- FSM design
- Timers and counters
- Sequential logic

**Status:** ✅ Completed 

---

## 📄 Constraints

- `Basys-3-Master.xdc`  
  Common constraint file used as a reference for pin assignments on the Basys 3 board.

---

## ▶️ How to Open a Project in Vivado

1. Launch **Vivado**
2. Open the corresponding project folder
3. Open the `.xpr` file *(if present)*  
   **OR**
4. Create a new project and add the source (`.v`, `.vhd`) and constraint (`.xdc`) files

---

## 🗂 Version Control Notes

- Generated Vivado files (`.runs`, `.cache`, `.sim`, etc.) are ignored
- Only **source files and constraints** should be committed
- Each project can evolve independently

---

## 🚀 Future Improvements

- [ ] Add UART project
- [ ] Add simulation screenshots
- [ ] Add block diagrams

---

## 📚 References

- Xilinx Vivado Documentation
- Basys 3 Reference Manual

---

## ✍️ Author

- Name: **Gaël BOYA**
- GitHub: [Adebayo17](https://github.com/Adebayo17)

---

## 📜 License

This project is for **educational and personal use**.

<!-- License details can be added later. -->
