       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKSEARCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-CUSTOMER-TABLE.
          05 WS-CUSTOMER OCCURS 5 TIMES
             INDEXED BY WS-IDX.
             10 WS-ACCOUNT-NO PIC X(5).
             10 WS-NAME PIC X(20).
             10 WS-BALANCE PIC 9(7).

       01 WS-SEARCH-ID PIC X(5).

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
           SET WS-IDX TO 1
           SEARCH WS-CUSTOMER
               AT END
                   DISPLAY "ACCOUNT NOT FOUND"
               WHEN WS-ACCOUNT-NO(WS-IDX)
                    = WS-SEARCH-ID
                   DISPLAY "ACCOUNT FOUND"
                   DISPLAY "CUSTOMER: "
                       WS-NAME(WS-IDX)
                   DISPLAY "BALANCE: "
                       WS-BALANCE(WS-IDX)
           END-SEARCH
           STOP RUN.
           