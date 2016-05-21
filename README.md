## tOS

This OS is being built with a i386-elf cross-compiler.

#How to build i386-elf cross-compiler

- Install the following packages on your system: `gcc` `make` `bison` `flex` `texinfo`

- Download the source packs of the following packages: `gcc` `binutils` `gmp` `mpfr` `mpc` 

- At the time of writing this, I downloaded the latest versions, which were: `gcc-6.1.0` `binutils-2.26` `gmp-6.1.0` `mpfr-3.1.4` `mpc-1.0.3`

- Unpack them in the same directory. Make sure you are in a file system in which you can create symbolic links.

- Create the following directories
```shell
mkdir build-binutils
mkdir build-gcc
```

- Create symbolic links from `gcc` to `gmp` `mpfr` `mpc`
```shell
cd gcc-6.1.0
ln -s ../gmp-6.1.0 gmp
ln -s ../mpfr-3.1.4 mpfr
ln -s ../mpc-1.0.3 mpc
cd ..
```

- Set the current shell session's variables as such:
```shell
export TARGET="i386-elf"
export PREFIX="/opt/cross/$TARGET"
export PATH="$PATH:$PREFIX/bin"
```

- Build `binutils`
```shell
cd build-binutils
../binutils-2.26/configure --prefix=$PREFIX --target=$TARGET --disable-multilib --disable-nls --disable-werror
make
make install
cd ..
```

- If the build succeeds, you should see executables like `i386-elf-as`, `i386-elf-ld`,... in `/opt/cross/i386-elf/bin`

- Build `gcc`. This can take a long time, up to an hour.
```shell
cd build-gcc
../gcc-6.1.0/configure --prefix=$PREFIX --target=$TARGET --disable-multilib --disable-nls --disable-werror --without-headers --enable-languages=c,c++
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
cd ..
```

Now, you should be able to use `i386-elf-gcc` to cross-compile.

--

The development of this project is currently suspended.

