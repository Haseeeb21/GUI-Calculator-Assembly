# GUI-Calculator-Assembly
Scientific Calculator that takes input and then calculates basic Mathematic Operations including Binary Operations with a little bit of GUI in Calculator. 



## Title:
A Simple GUI Scientific Calculator



## Objective:

The goal of this project work is to utilize the concepts and knowledge of Assembly Language and use them in the Project. That is what I have learned so far and use the concepts of different Instructions in this project. And to understand the working of instructions and the code of Assembly Language using emulator EMU8086. 


## Theory:

The calculator that I build performs simple Mathematical Operations such as Addition, Subtraction, Multiplication and Division. Further it can perform NEG operation (changes the sign of the input), find the Modulus, calculate binary OR, binary AND, binary XOR, binary NOT, calculate Square and calculate Cube of the number. The user will be guided in the attractive menu with a little bit of graphic mode in menu.


## Implementation:

I used EMU8086.inc Library which provides built in functions such as:
print ‘STRING’ – For printing String
scan_num – For taking Integer Input
print_num – For displaying value stored in register
printn – For printing New Line 
0dh and 0ah as well as print10 and print13 can also be used to move to new line.

## Interrupts used:

![image](https://user-images.githubusercontent.com/91841622/193593208-249bb61b-8dfc-4a12-bb98-4452c2b03c48.png)
![image](https://user-images.githubusercontent.com/91841622/193593284-83502373-ebf9-4b12-9ac7-161f10a09261.png)


I have made functions of different operations of the Calculator, such as
### Addition:
….

..code..

….

### Subtraction:
….

..code..

….

Etc., 

In data segment I have declared some variables as Uninitialized and some strings with string values.
I also gave touch to GUI a little bit.

![image](https://user-images.githubusercontent.com/91841622/193593584-122a07f0-7684-4f4f-a0fe-24c6de26aa00.png)


## Different Functions of Operations:

- Addition

Addition of two numbers.

-	Subtraction

Subtraction of two numbers.

-	Multiplication

Multiplication of two numbers.

-	Division

Division of two numbers.

-	Modulus

Modulus of two numbers.

-	Negate

Negation of a number.

-	Square

Square of a number.

- Cube 

Cube of a number.

-	Binary OR

OR of two numbers.

-	Binary AND

AND of two numbers.

-	Binary XOR

XOR of two numbers.

-	Binary NOT

NOT of two numbers.

-	Continue 

Asks the user whether to use again or exit.

-	Exit

Exits from the program.

## Debugging-Test-Run

When the user runs the program, a main menu will display as below in graphics mode.

 ![image](https://user-images.githubusercontent.com/91841622/193594660-6599adb9-3906-43eb-9474-6ff99cc2220e.png)

The user will now input the operation number he would like to perform, such as 1 for addition, 2 for subtraction and so on,

![image](https://user-images.githubusercontent.com/91841622/193594692-f6c8388a-91d0-4353-970c-9c71fecf806e.png)

Then the user will be asked to enter two numbers to perform the selected operation after entering the number the operation will be performed and the answer will be displayed on the screen.

![image](https://user-images.githubusercontent.com/91841622/193594749-aa42c1e3-2d22-404e-a785-0f0877f3a701.png)

With the answer displayed the option of using the calculator again will also be displayed. If the user enters 1 then the calculator will start again from beginning.

![image](https://user-images.githubusercontent.com/91841622/193594769-efb9b4fc-8d60-439b-92e6-ea2efa074fd5.png)

If the user enters 0 then the program will jump to exit function and then display the message and terminates the program.

![image](https://user-images.githubusercontent.com/91841622/193594806-e8f06078-df56-432a-87a8-6667a2d7a871.png)

After this the emulator will be halted and the program is executed.

![image](https://user-images.githubusercontent.com/91841622/193596697-da026a58-7a4f-4f75-9db5-2ab18adcca09.png)




