# Assembly-Stack-Program

This is a simple stack program written in x86 assembly language.The program allows the user to preform basic stack operations such as push, pop, peek , check size and check if the stack is empty. 


## Table of Contents
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Program Overview](#program-overview)
- [Supported Operations](#supported-operations)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To run this program, you will need an environment that supports 16-bit assembly programs. The code is compatible with TASM (Turbo Assembler). Follow the steps below to compile and execute the program.

1. **Clone the repository to your local machine:**

    ```bash
    git clone https://github.com/your-username/assembly-stack-program.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd assembly-stack-program
    ```

3. **Compile the assembly code using TASM:**

    ```bash
    tasm program.asm
    ```

4. **Link the object file to create an executable:**

    ```bash
    tlink program.obj
    ```

5. **Run the executable:**

    ```bash
    program.exe
    ```

Ensure that you have TASM installed and configured in your environment for successful compilation.

## Usage

Upon running the program, you will be prompted with a menu to choose stack operations. Follow the on-screen instructions to perform push, pop, peek, size, and isEmpty operations.

## Program Overview

The program is structured as a menu-driven application with options for various stack operations. Here is a brief overview of the main components:

- **Header**: Displays a banner at the top of the program.

- **Options Menu**: Presents the user with choices for stack operations.

- **Operation Execution**: Executes the chosen stack operation based on user input.

- **Play Again**: After completing an operation, the user can choose to continue or exit the program.

## Supported Operations

1. **Push**: Add an element to the stack.

2. **Pop**: Remove the top element from the stack.

3. **Peek**: View the top element of the stack without removing it.

4. **Size**: Display the current size of the stack.

5. **isEmpty**: Check if the stack is empty.
