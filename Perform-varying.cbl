       IDENTIFICATION DIVISION.
       PROGRAM-ID. MONTHBANK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-TABLE.
          05 WS-MONTH OCCURS 3 TIMES.
             10 WS-DEPOSIT PIC 9(6).
             10 WS-WITHDRAW PIC 9(6).

       01 WS-I PIC 9 VALUE 1.
       01 WS-TOTAL PIC 9(8) VALUE 0.

       PROCEDURE DIVISION.

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 3

               DISPLAY "ENTER DEPOSIT:"
               ACCEPT WS-DEPOSIT(WS-I)

               DISPLAY "ENTER WITHDRAWAL:"
               ACCEPT WS-WITHDRAW(WS-I)

               ADD WS-DEPOSIT(WS-I)
                   TO WS-TOTAL

               SUBTRACT WS-WITHDRAW(WS-I)
                   FROM WS-TOTAL

           END-PERFORM

           DISPLAY "FINAL BANK BALANCE: " WS-TOTAL

           STOP RUN.
