# llvm-mingw toolchain (Clang) for Windows x86_64 DLLs that inject cleanly under Proton.
# Matches the known-good Dumper-7 Linux build: MS-compatible ABI + fully static runtimes.

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(LLVM_MINGW_ROOT "/opt/llvm-mingw" CACHE PATH "llvm-mingw install prefix")
set(CMAKE_C_COMPILER   "${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-clang")
set(CMAKE_CXX_COMPILER "${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-clang++")
set(CMAKE_RC_COMPILER  "${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-windres")
set(CMAKE_ADDR2LINE    "${LLVM_MINGW_ROOT}/bin/llvm-addr2line")
set(CMAKE_AR           "${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-llvm-ar")
set(CMAKE_RANLIB       "${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-llvm-ranlib")
set(CMAKE_NM           "${LLVM_MINGW_ROOT}/bin/llvm-nm")
set(CMAKE_OBJCOPY      "${LLVM_MINGW_ROOT}/bin/llvm-objcopy")
set(CMAKE_OBJDUMP      "${LLVM_MINGW_ROOT}/bin/llvm-objdump")
set(CMAKE_STRIP        "${LLVM_MINGW_ROOT}/bin/llvm-strip")
set(CMAKE_LINKER       "${LLVM_MINGW_ROOT}/bin/ld.lld")

set(CMAKE_FIND_ROOT_PATH "${LLVM_MINGW_ROOT}/x86_64-w64-mingw32")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Prefer static libgcc/libc++/winpthread so Proton does not need companion DLLs.
set(CMAKE_SHARED_LINKER_FLAGS_INIT "-static -static-libgcc -static-libstdc++")
set(CMAKE_EXE_LINKER_FLAGS_INIT    "-static -static-libgcc -static-libstdc++")

# fms-compatibility without advertising as MSVC to the Windows headers.
set(CMAKE_C_FLAGS_INIT   "-U_MSC_VER -U_MSC_FULL_VER -U_MSC_BUILD -fgnuc-version=4.2.1")
set(CMAKE_CXX_FLAGS_INIT "-U_MSC_VER -U_MSC_FULL_VER -U_MSC_BUILD -fgnuc-version=4.2.1")
