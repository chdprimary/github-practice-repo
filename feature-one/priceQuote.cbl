      ******************************************************************
      *  THE PURPOSE OF THIS PROGRAM IS TO TAKE A CUSTOMER'S NAME AND  *
      *    SALES AMOUNT, THEN CALCULATE A DISCOUNT AND FINAL PRICE.    *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.
           deanAssignment3.
       AUTHOR.
           Christian Dean.
       DATE-WRITTEN.
           Feb 09 2011
       DATA DIVISION.
      ******************************************************************
      *CREATED SALES-OUT SO THAT THE DECIMAL WOULD PRINT IN THE OUTPUT *
      ******************************************************************
       WORKING-STORAGE SECTION.
       01  MORE-DATA                   PIC X(3) VALUE 'YES'.
       01  IDENT-IN                    PIC X(5).
       01  SALES-IN                    PIC 999V99.
       01  SALES-OUT                   PIC 999.99.
       01  WS-DISCOUNT-AMT             PIC 999V99.
       01  DISCOUNT-PERCENT-OUT        PIC V99.
       01  NET-OUT                     PIC 999.99.
       PROCEDURE DIVISION.
       100-MAIN-MODULE.
           PERFORM UNTIL MORE-DATA = 'NO '
               DISPLAY ' '
               DISPLAY "PLEASE ENTER THE CUSTOMER'S ID IN FORMAT XXXXX."
               ACCEPT IDENT-IN
               DISPLAY ' '
               DISPLAY "PLEASE ENTER THE CUSTOMER'S SALES IN FORMAT 999.
      -        "99."
               ACCEPT SALES-IN
               PERFORM 200-PROCESS-DATA
           END-PERFORM
           STOP RUN.
       200-PROCESS-DATA.
           MOVE SALES-IN TO SALES-OUT
           IF SALES-IN > 100.00
               MOVE .03 TO DISCOUNT-PERCENT-OUT
           ELSE
               MOVE .02 TO DISCOUNT-PERCENT-OUT
           END-IF
           MULTIPLY SALES-IN BY DISCOUNT-PERCENT-OUT GIVING
               WS-DISCOUNT-AMT
           SUBTRACT WS-DISCOUNT-AMT FROM SALES-IN GIVING NET-OUT
      ******************************************************************
      *     USED EMPTY LINES TO MAKE THE CONSOLE MORE USER-FRIENDLY    *
      ******************************************************************
           DISPLAY ' '
           DISPLAY 'RECORD CREATED:'
           DISPLAY ' '
           DISPLAY 'ID:       ', IDENT-IN
           DISPLAY 'SALES:    ', SALES-OUT
           DISPLAY 'DISCOUNT: .', DISCOUNT-PERCENT-OUT, '%'
           DISPLAY 'NET:      ', NET-OUT
           DISPLAY ' '
           DISPLAY 'IS THERE MORE DATA?'
           ACCEPT MORE-DATA
