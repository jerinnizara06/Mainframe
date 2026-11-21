       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKTRAN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BALANCE PIC 9(7) VALUE 50000.
       01 WS-AMOUNT PIC 9(6).
       01 WS-CHOICE PIC X.
       

       PROCEDURE DIVISION.
           PERFORM PROCESS-TRANSACTION 5 TIMES
           DISPLAY "FINAL ACCOUNT BALANCE: " WS-BALANCE
           STOP RUN.

       PROCESS-TRANSACTION.

           DISPLAY "ENTER TRANSACTION TYPE (D/W): "
           ACCEPT WS-CHOICE

           DISPLAY "ENTER TRANSACTION AMOUNT: "
           ACCEPT WS-AMOUNT

           IF WS-CHOICE = "D"
               ADD WS-AMOUNT TO WS-BALANCE
               DISPLAY "DEPOSIT SUCCESSFUL"
           ELSE
               IF WS-CHOICE = "W"
                   IF WS-AMOUNT <= WS-BALANCE
                       SUBTRACT WS-AMOUNT FROM WS-BALANCE
                       DISPLAY "WITHDRAWAL SUCCESSFUL"
                   ELSE
                       DISPLAY "INSUFFICIENT BALANCE"
                   END-IF
               ELSE
                   DISPLAY "INVALID TRANSACTION TYPE"
               END-IF
           END-IF
           DISPLAY "CURRENT BALANCE: " WS-BALANCE

