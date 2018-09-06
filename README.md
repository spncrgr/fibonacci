# Fibonacci

This is a demo application for providing a Fibonacci number at a given location.
The application assumes a standard Fibonacci sequence `[1, 1, 2, 3, 5, ...]`.

There are two methods used:
  1. Generation
     1. Generate a Fibonacci sequence of length _n_
     1. Return the Fibonacci number at location _v_
  1. Calculation
     1. Use a formula to calculate the Fibonacci number at location _v_ (without generating the sequence).
     
## How to run

### Docker

The easiest way to run this program is via the Docker image.
```bash
docker run spncrgr/fibonacci help
```

This will pull the image from Docker Hub and print out it's usage:
```text
Commands:
  fib calculate NUM   # Return the NUMth item in a standard Fibonacci sequence
  fib generate NUM    # generate a Fibonacci sequence and return the NUMth nu...
  fib help [COMMAND]  # Describe available commands or one specific command
```

### Ruby

If you have Ruby installed on your system, you can also run the application directly by cloning this repo.
```bash
$ git clone https://github.com/spncrgr/fibonacci.git
$ cd fibonacci
$ ruby exe/fib help
```

This will print out the same usage instructions as with the Docker image.

## Example Usage

> Note: The examples provide the commands for running via Docker image or Ruby, respectively.

##### Generate a sequence of the first 10 Fibonacci numbers and return the value of the 10th number:
```bash
$ docker run spncrgr/fibonacci generate 10
# OR
$ ruby exe/fib generate 10
```
OUTPUT:
```text
Generating a sequence of 10 Fibonacci number(s)...
The Fibonacci number at entry 10 is 55

Time:
       user     system      total        real
   0.000041   0.000003   0.000044 (  0.000012)
```

##### Calculate the value of the 10th number in a Fibonacci sequence:
```bash
$ docker run spncrgr/fibonacci calculate 10
# OR
$ ruby exe/fib calculate 10
```
OUTPUT:
```text
The Fibonacci number at position 10 of a standard
sequence is 55

Time:
       user     system      total        real
   0.000166   0.000154   0.000320 (  0.000675)
```
