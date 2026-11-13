       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKSUB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-CUSTOMER-TABLE.
          05 WS-CUSTOMER OCCURS 5 TIMES.
             10 WS-ACCOUNT-NO PIC X(5).
             10 WS-NAME PIC X(20).
             10 WS-BALANCE PIC 9(7).

       01 WS-I PIC 9 VALUE 1.
       01 WS-SEARCH-ID PIC X(5).
       01 WS-WITHDRAW PIC 9(7).
       01 WS-FOUND PIC X VALUE "N".

       PROCEDURE DIVISION.

           MOVE "C101" TO WS-ACCOUNT-NO(1)
           MOVE "ARUN" TO WS-NAME(1)
           MOVE 25000 TO WS-BALANCE(1)
           MOVE "C102" TO WS-ACCOUNT-NO(2)
           MOVE "NIZARA" TO WS-NAME(2)
           MOVE 75000 TO WS-BALANCE(2)
           MOVE "C103" TO WS-ACCOUNT-NO(3)
           MOVE "PRIYA" TO WS-NAME(3)
           MOVE 40000 TO WS-BALANCE(3)
           MOVE "C104" TO WS-ACCOUNT-NO(4)
           MOVE "RAHUL" TO WS-NAME(4)
           MOVE 90000 TO WS-BALANCE(4)
           MOVE "C105" TO WS-ACCOUNT-NO(5)
           MOVE "DIVYA" TO WS-NAME(5)
           MOVE 60000 TO WS-BALANCE(5)
           DISPLAY "ENTER ACCOUNT NUMBER:"
           ACCEPT WS-SEARCH-ID
           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 5 OR WS-FOUND = "Y"
               IF WS-ACCOUNT-NO(WS-I) = WS-SEARCH-ID
                   MOVE "Y" TO WS-FOUND
               END-IF
           END-PERFORM
           IF WS-FOUND = "Y"
               DISPLAY "CUSTOMER FOUND"
               DISPLAY "NAME: "
                   FUNCTION TRIM(WS-NAME(WS-I))
               DISPLAY "CURRENT BALANCE: "
                   WS-BALANCE(WS-I)
               DISPLAY "ENTER WITHDRAWAL AMOUNT:"
               ACCEPT WS-WITHDRAW
               IF WS-WITHDRAW <= WS-BALANCE(WS-I)
                   SUBTRACT WS-WITHDRAW
                       FROM WS-BALANCE(WS-I)
                   DISPLAY "WITHDRAWAL SUCCESSFUL"
                   DISPLAY "UPDATED BALANCE: "
                       WS-BALANCE(WS-I)
               ELSE
                   DISPLAY "INSUFFICIENT BALANCE"
               END-IF
           ELSE
               DISPLAY "ACCOUNT NOT FOUND"
           END-IF
           STOP RUN.
