// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VXOR21__SYMS_H_
#define VERILATED_VXOR21__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "Vxor21.h"

// INCLUDE MODULE CLASSES
#include "Vxor21___024root.h"

// SYMS CLASS (contains all model state)
class Vxor21__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vxor21* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vxor21___024root               TOP;

    // CONSTRUCTORS
    Vxor21__Syms(VerilatedContext* contextp, const char* namep, Vxor21* modelp);
    ~Vxor21__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
