#!/usr/bin/env zsh
# ==========================================
# OS Track - Week 1: Exercise Set & Review
# ==========================================

# 1. Create lab1 files (already created: a.txt, b.txt, c.txt)
touch a.txt b.txt c.txt

# 2. Set permissions on a.txt (owner: rw, group: r, others: none)
chmod 640 a.txt
ls -l a.txt
# Why 640? read=4, write=2, execute=1 -> Owner=4+2=6 (rw-), Group=4 (r--), Others=0 (---).

# 3. Inspect running kernel info
cat /proc/version
# Output shows 64-bit Linux kernel 7.2.15+kali-amd64, built with GCC 16.2.0,
# supporting multi-core (SMP) and dynamic preemption (Nov 3, 2026).

# 4. Resource Manager vs. Extended Machine
# - Resource Manager: Referee sharing limited hardware (CPU, RAM, disk) safely among programs.
#   Lab example: chmod 640 and chown controlling access to a.txt.
# - Extended Machine: Hides messy hardware details behind clean interfaces (open, read, write).
#   Lab example: touch or cat /proc/version instead of reading raw disk sectors/RAM addresses.

# 5. Why /dev/sda representing a physical disk as a file is useful
# Lets programs read/write raw storage using normal file calls (open, read, write)
# and standard tools (dd, cat) while reusing file permissions for security.
# Without it, every app would need custom drivers for every SATA/NVMe/USB controller
# and manage disk sectors, DMA, and hardware interrupts directly.

# ==========================================
# Review Questions
# ==========================================
# 1. Four core OS responsibilities: Process management, Memory management,
#    File management, and Device management.
# 2. Apps cannot talk to hardware directly for safety/isolation (preventing crashes or
#    disk/RAM corruption) and portability across different hardware devices.
# 3. General-purpose OS optimizes for fairness/throughput; Real-Time OS (RTOS) optimizes
#    for strict deadlines and deterministic response times (late = failure).
# 4. In -rwxr-xr--: '-' is file type (regular file); 'rwx' = owner, 'r-x' = group, 'r--' = others.
# 5. /home stores persistent files on disk; /proc is a virtual in-memory filesystem (0 bytes on disk)
#    generated dynamically by the kernel to show live CPU, memory, and process info.
