       IDENTIFICATION DIVISION.
       PROGRAM-ID. ch5ex8.
      ******************************************************************
      *AUTHOR. Christian Dean.                                         *
      *DATE-WRITTEN. 3 Mar 2011.                                       *
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.                 SELECT INVENTORY-OUT
      ******************************************************************
      *REMEMBER TO CHANGE THE OUTPUT FILE DESTINATION DEPENDING ON THE *
      *                   COMPUTER IT IS RUN FROM                      *
      ******************************************************************
                                     ASSIGN TO 'C:\CHAPTER5\INVENTORY.DA
      -                              'T'.
       DATA DIVISION.
       FILE SECTION.
       FD  INVENTORY-OUT.
       01  INVENTORY-RECORD.
           05  PART-NO-OUT           PIC X(5).
           05  PART-DESCRIPTION-OUT  PIC X(15).
           05  QTY-ON-HAND-OUT       PIC 9(5).
           05  UNIT-PRICE-OUT        PIC 999.99.
       WORKING-STORAGE SECTION.
       01  MORE-DATA-IN              PIC A(1) VALUE 'Y'.
       01  PART-NO-IN                PIC X(5).
       01  PART-DESCRIPTION-IN       PIC X(15).
       01  QTY-ON-HAND-IN            PIC 9(5).
       01  UNIT-PRICE-IN             PIC 999V99.
       PROCEDURE DIVISION.
       100-MAIN-MODULE.
           PERFORM UNTIL MORE-DATA-IN = 'N'
               OPEN OUTPUT INVENTORY-OUT
               MOVE SPACES TO INVENTORY-RECORD
               DISPLAY 'ENTER PART-NO'
               ACCEPT PART-NO-IN
               MOVE PART-NO-IN TO PART-NO-OUT
               DISPLAY 'ENTER PART-DESCRIPTION'
               ACCEPT PART-DESCRIPTION-IN
               MOVE PART-DESCRIPTION-IN TO PART-DESCRIPTION-OUT
               DISPLAY 'ENTER QTY-ON-HAND'
               ACCEPT QTY-ON-HAND-IN
               MOVE QTY-ON-HAND-IN TO QTY-ON-HAND-OUT
               DISPLAY 'ENTER UNIT-PRICE'
               ACCEPT UNIT-PRICE-IN
               MOVE UNIT-PRICE-IN TO UNIT-PRICE-OUT
               DISPLAY 'IS THERE MORE DATA(Y/N)?'
               ACCEPT MORE-DATA-IN
               WRITE INVENTORY-RECORD
               CLOSE INVENTORY-OUT
           END-PERFORM.
       STOP RUN.
