global long_mode_start
extern kernel_main

section .text
bits 64
long_mode_start:
  ; load null into all data segment registers
  mov ax, 0
  mov ss, ax
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  ; print 'OK' for testing the 64-bits mode
  ; mov dword [0xb8000], 0x2f4b2f4f   ; write video memory
	call kernel_main
  hlt
