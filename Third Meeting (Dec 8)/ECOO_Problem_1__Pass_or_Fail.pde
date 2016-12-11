/**
 * This Program is an example processing solution to the ECOO Problem 1: Pass or Fail
 * This is property of the John Fraser 2 - 2015/16 team and John Fraser Computer Club
 *
 * @author   Jason Lee, Obayed Elsayed, Wenqin Ye, Amin Eljirby
 * @since    2016 04 06
 * @version  1.3
 * 
 * This is the modified version of the original program (from Java to Processing)
 */



//input will be pasted at the bottom, 
//make sure you attach a file to this 
//program in order for the program to run

String fileName = "DATA12.txt";                                                            // name of the file input
String [] inputText;                                                                       // array of strings, ea. element of the array is one line of the input
int lineNumber = -1;                                                                       // reference to which line in the input array is being read


void setup() {                                                                             // when competing, you will not need to loop, you should have loops within
                                                                                           // your program, but the program itself shouldn't loop
                                                                                           
  inputText = loadStrings("DATA12.txt");                                                   // loadStrings is the function that loads the file as a String []
  for (int k = 0; k < 10; k++) {                                                           // by convention, the variables i, j, and k are used as for loop variables
                                                                                           // k has values that extend up until 10 because it is specified there are 10 cases

    lineNumber++;                                                                          // Move to the next line in the input
    
    String[] weights = inputText[lineNumber].split(" ");                                   // .spilt() function takes a String and breaks it into a String []
    int numPasses = 0;                                                                     // Variable that counts how many students are passing
    lineNumber++;                                                                          // Move to the next line in the input

    int numStudents = Integer.parseInt(inputText[lineNumber]);                             // The input has the number of students as a String, you can't do math with or
                                                                                           // count with a String (or in other words -- a word) thus the Integer.parseInt()  
                                                                                           // function parses or converts the String into an integer that can be understood 
                                                                                           // and used/comprehended by the computer.
                                                                                           
    for (int i = 0; i < numStudents; i ++) {                                               // i has values that extend up until the number of students (one loop per student)
      lineNumber++;                                                                        // Move on to next line in the input

      String[] marks = inputText[lineNumber].split(" ");                                   // Again, .spilt() function takes a String and breaks it into a String [] 
      float currentMark = 0;                                                               // A variable that was created to hold a mark value and is reset to 0 every student
      
      for (int j = 0; j < marks.length; j++) {                                             // j has values that extend up to 4 (4 loops -- 1 loop per mark)
    
        currentMark += Float.parseFloat(marks[j]) * (Float.parseFloat(weights[j])/100.0f); // currentMark variable increases by the marks modified by the weight factors
                                                                                           // Float.parseFloat() is used to convert values from a String to a float.
                                                                                           // Note that Float.parseFloat was used and not Integer.parseInt was used,
                                                                                           // This is because the mark can be a decimal number, thus if you defined it
                                                                                           // as an integer, you would end up with an error
    }
      if (currentMark >= 50) {                                                             // An if-statement that checks to see if the currentMark calculated is a passing grade
        numPasses ++;                                                                      // An operator '++' (increment) is used to increase the number of passing students 
      }
    }
    System.out.println(numPasses);                                                         // System.out.println() or in processing just 'println()', is how you output to console
  }
}