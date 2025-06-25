# FSM-based-Secure-Lock-System
It is a secure puzzle lock system using FSM  that unlocks only upon entering a specific sequence.
Designed using a Finite State Machine (FSM) with 5 states (S0 to S4).
 Accepts a 4-step input pattern: 0001 →
 0010 →
 0011 →
 0100.
 Resets to initial state on any incorrect input, ensuring security.
 Uses onboard push-buttons as input (no external components needed).
 Provides real-time feedback via:
 7-segment display (Y for correct, N for wrong, U for unlock).
 GREEN LED for correct input indication.
 RED LED for incorrect input indication.
 Automatically resets after successful unlock for repeated use.
 Fully implemented on Boolean board (Spartan-6 FPGA) with the help of coding in vivado verilog.
 Demonstrates concepts of FSM design, pattern recognition, and input validation.
 Ideal for educational use, secure access demo, and FPGA practice.
