IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-BALANCE PIC 9(5) VALUE 1000.
       01 WS-AMOUNT  PIC 9(5) VALUE 0.
       01 WS-CHOICE  PIC 9 VALUE 0.

       PROCEDURE DIVISION.

           DISPLAY "===== BANKING SYSTEM ====="
           DISPLAY "1. Deposit"
           DISPLAY "2. Withdraw"
           DISPLAY "Enter your choice: "
           ACCEPT WS-CHOICE

           DISPLAY "Current balance: " WS-BALANCE
           DISPLAY "Enter amount: "
           ACCEPT WS-AMOUNT

           IF WS-CHOICE = 1
               ADD WS-AMOUNT TO WS-BALANCE
               DISPLAY "Deposit successful!"
               DISPLAY "Updated balance: " WS-BALANCE
           ELSE
               IF WS-CHOICE = 2
                   IF WS-AMOUNT <= WS-BALANCE
                       SUBTRACT WS-AMOUNT FROM WS-BALANCE
                       DISPLAY "Withdrawal successful!"
                       DISPLAY "Updated balance: " WS-BALANCE
                   ELSE
                       DISPLAY "Insufficient balance!"
                   END-IF
               ELSE
                   DISPLAY "Invalid choice!"
               END-IF
           END-IF

           STOP RUN.
