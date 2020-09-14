# coretemp

Outputs current CPU core temperatures on macOS.

## Usage 

### Compiling

```bash
make
```

### Running

```bash
./coretemp
```

or

```bash
sudo make install # installs to /usr/local/bin
coretemp
```

### Output example

```
62
58
59
58
```

### Options

 * `-C` Output temperature in Celsius (default).
 * `-F` Output temperature in Fahrenheit.
 * `-c <num>` Specify which cores to report on, in a comma-separated list. If unspecified, reports all temperatures.
 * `-r <num>`  The accuracy of the temperature, in the number of decimal places. Defaults to 0.
 * `-p` Display the CPU package temperature instead of the core temperatures.
 
## Maintainer 

hacker1024 \<hacker1024@users.sourceforge.net\>

### Source 

Apple System Management Control (SMC) Tool 
Copyright (C) 2006

### Inspiration 

 * https://github.com/lavoiesl/osx-cpu-temp
 * https://www.eidac.de/smcfancontrol/
 * https://github.com/hholtmann/smcFanControl/tree/master/smc-command
