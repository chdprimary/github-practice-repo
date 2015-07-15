
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CH04PPB.
      ********************************************
      *  Sample - Updates a file with employee   *
      *             names and salaries           *
      ********************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN-EMPLOYEE-FILE
               ASSIGN TO "U:\CHAPTER4\CH04PP.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUT-SALARY-FILE
               ASSIGN TO "U:\CHAPTER4\CH04PPS.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
      *
       DATA DIVISION.
       FILE SECTION.
       FD  IN-EMPLOYEE-FILE.
       01  IN-EMPLOYEE-REC.
           05  IN-EMPLOYEE-NAME          PIC X(20).
           05  IN-SALARY                 PIC X(5).
           05  IN-NO-OF-DEPENDENTS       PIC X(1).
           05  IN-FICA                   PIC X(5).
           05  IN-STATE-TAX              PIC X(6).
           05  IN-FED-TAX                PIC X(6).
           05  DATE-OF-HIRE.
               10  MO                    PIC 99.
               10  DA                    PIC 99.
               10  YR                    PIC 9(4).
       FD  OUT-SALARY-FILE.
       01  OUT-SALARY-REC.
           05  OUT-EMPLOYEE-NAME         PIC X(20).
           05  OUT-SALARY                PIC X(5).
       WORKING-STORAGE SECTION.
       01  WS-WORK-AREAS.
           05  ARE-THERE-MORE-RECORDS    PIC X(3)  VALUE 'YES'.
      *
       PROCEDURE DIVISION.
      **********************************************************
      *  100-MAIN-MODULE - Controls opening and closing files  *
      *                    and direction of program logic;     *
      *                    returns contol to operationg system *
      **********************************************************
       100-MAIN-MODULE.
           OPEN INPUT  IN-EMPLOYEE-FILE
                OUTPUT OUT-SALARY-FILE
           MOVE SPACES TO OUT-SALARY-REC
           PERFORM UNTIL ARE-THERE-MORE-RECORDS = 'NO '
               READ IN-EMPLOYEE-FILE
                   AT END
                      MOVE 'NO ' TO ARE-THERE-MORE-RECORDS
                   NOT AT END
                      PERFORM 200-PROCESS-RTN
               END-READ
           END-PERFORM
           CLOSE IN-EMPLOYEE-FILE
                 OUT-SALARY-FILE
           STOP RUN.
      ***********************************************************
      *  200-PROCESS-RTN - Performed from 100-MAIN-MODULE       *
      *                    moves employee information to output *
      *                    areas, then writes the record        *
      ***********************************************************
       200-PROCESS-RTN.
           MOVE IN-EMPLOYEE-NAME TO OUT-EMPLOYEE-NAME
           MOVE IN-SALARY TO OUT-SALARY
           WRITE OUT-SALARY-REC.

