       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPPAY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-EMP-NAME PIC X(20).
       01 WS-SALARY PIC 9(7)V99.
       01 WS-RATING PIC X.
       01 WS-EXPERIENCE PIC 99.

       01 WS-BONUS-RATE PIC 99.
       01 WS-BONUS PIC 9(7)V99.
       01 WS-EXTRA PIC 9(5) VALUE 0.
       01 WS-FINAL-SALARY PIC 9(7)V99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER EMPLOYEE NAME:"
           ACCEPT WS-EMP-NAME

           DISPLAY "ENTER BASIC SALARY:"
           ACCEPT WS-SALARY

           DISPLAY "ENTER PERFORMANCE RATING (A-D):"
           ACCEPT WS-RATING

           DISPLAY "ENTER EXPERIENCE IN YEARS:"
           ACCEPT WS-EXPERIENCE

           EVALUATE WS-RATING
               WHEN "A"
                   MOVE 20 TO WS-BONUS-RATE
               WHEN "B"
                   MOVE 15 TO WS-BONUS-RATE
               WHEN "C"
                   MOVE 10 TO WS-BONUS-RATE
               WHEN "D"
                   MOVE 5 TO WS-BONUS-RATE
               WHEN OTHER
                   MOVE 0 TO WS-BONUS-RATE
           END-EVALUATE

           COMPUTE WS-BONUS =
               WS-SALARY * WS-BONUS-RATE / 100
           EVALUATE TRUE
               WHEN WS-EXPERIENCE > 5
                   MOVE 5000 TO WS-EXTRA
               WHEN WS-EXPERIENCE < 1
                   MOVE 0 TO WS-EXTRA
               WHEN OTHER
                   MOVE 0 TO WS-EXTRA
           END-EVALUATE
           COMPUTE WS-FINAL-SALARY =
               WS-SALARY + WS-BONUS + WS-EXTRA
           DISPLAY "EMPLOYEE PAYROLL DETAILS"
           DISPLAY "EMPLOYEE NAME: "
                   FUNCTION TRIM(WS-EMP-NAME)
           DISPLAY "BASIC SALARY: " WS-SALARY
           DISPLAY "BONUS RATE: " WS-BONUS-RATE "%"
           DISPLAY "BONUS AMOUNT: " WS-BONUS
           DISPLAY "EXTRA ALLOWANCE: " WS-EXTRA
           DISPLAY "FINAL SALARY: " WS-FINAL-SALARY
           STOP RUN.
