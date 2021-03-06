# Write Your Own 64-bit Operating System Kernel #1 - Boot code and multiboot header

https://www.youtube.com/watch?v=FkrpUaGThTQ&list=PLZQftyCk7_SeZRitx5MjBKzTtvk0pHMtp&ab_channel=CodePulse


## gcc building tools in Docker
Create the build env based on randomdude/gcc-cross-x86_64-elf, which holds all the gcc compilation tools

The grub package is for building the final iso

Build docker image
```
  docker build buildenv -t myos-buildenv
```

Start the container
Linux 
```
  docker run --rm -it -v "$pwd":/root/env myos-buildenv
``` 
Mac
```
  docker run --rm -it -v "$PWD":/root/env myos-buildenv
```
Windows
```
  docker run --rm -it -v %cd%:/root/env myos-buildenv
```
Now we are inside a virtual linux machine at /root/env


## bootloader 
The bootloader find the OS on USB, HD, CD ... and start it

following the multiboot2 specification

计算机读取"主引导记录"前面446字节的机器码之后，会运行事先安装的“启动管理器”bootloader，由用户选择启动哪个内核，之后就会载入内核，将控制权交给内核。GNU GRUB（GRand Unified Bootloader）就是一种bootloader，满足多重引导规范（The Multiboot Specification），GRUB可选择操作系统分区上的不同内核

(1) 内核的前8K字节内必须要包含多重引导规范的头信息（Multiboot Header）
(2) 内核要加载在内存地址的1MB以上。

Multiboot Header它必须包含4字节对齐的3个域（还有其他非必须域，我们不讨论），如下：

魔数域（magic）：标志头的魔数，必须等于 0x1BADB002。。
标志域（flag）：是否需要引导程序支持某些特性，我们不关心这些特性，这个标志置为0。
校验域（checksum）：校验等式是否成立（magic + flags + checksum = 0）


## build
In the docker environment
```
  make build-x86_64
```
create the dist folder


## run the iso in host environment
In host environment (not the docker)
```
  qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso
```
or use
```
  make run
```