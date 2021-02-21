


## folder structre
```
  buildenv              # Docker image for building tools
  src
    impl
      x86_64
        boot
          header.asm        # magic data will be included to OS, bootloader can understand
          main.asm          # entry point of the OS
  target
    x86_64                  # build config for x86
      linker.ld             # link config
      iso                   # GRUP config and bin file of the OS kernel
        boot
          grub
            grub.cfg        # GRUP config for the final iso file
```

asm -> build/*.o -> dist/*.bin -> target/*.bin -> dist/*.iso