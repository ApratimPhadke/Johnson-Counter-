`timescale 1ns/1ps

module tb_jc_v;

  // Signal Declarations
  reg clk;
  reg rst;
  wire [3:0] count;

  // Device Under Test (DUT) Instantiation
  jc_v dut(
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock Generator: Toggles every 5ns
  always #5 clk = ~clk;

  // Stimulus and Simulation Control Block
  initial begin
    // --- FIX 1: Initialize all signals driven by the testbench ---
    clk = 0; // Start the clock at a known value (0)
    rst = 1; // Assert reset

    // Wait for 10ns then de-assert reset
    #10;
    rst = 0;

    // Let the simulation run for another 100ns
    #100;

    // --- FIX 2: Place simulation control tasks inside a procedural block ---
    $finish; // End the simulation (replaces the misplaced $stop and $finish)
  end

endmodule