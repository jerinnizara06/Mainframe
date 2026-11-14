       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTFILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CUSTOMER-FILE
           ASSIGN TO "CUSTOMER.DAT"
           ORGANIZATION IS SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD CUSTOMER-FILE.
       01 CUSTOMER-RECORD.
          05 FD-ACCOUNT-NO PIC X(5).
          05 FD-CUSTOMER-NAME PIC X(20).
          05 FD-STATUS PIC X.
          05 FD-BALANCE PIC 9(7).

       WORKING-STORAGE SECTION.

       01 WS-FILE-STATUS PIC XX.
       01 WS-EOF PIC X VALUE "N".
       01 WS-COUNT PIC 99 VALUE 0.
       01 WS-TOTAL-BALANCE PIC 9(9) VALUE 0.
       PROCEDURE DIVISION.
           OPEN INPUT CUSTOMER-FILE
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "ERROR OPENING CUSTOMER FILE"
               DISPLAY "FILE STATUS: " WS-FILE-STATUS
               STOP RUN
           END-IF
           PERFORM UNTIL WS-EOF = "Y"
               READ CUSTOMER-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       ADD 1 TO WS-COUNT
                       ADD FD-BALANCE
                           TO WS-TOTAL-BALANCE
                       DISPLAY " "
                       DISPLAY "ACCOUNT NUMBER: "
                           FD-ACCOUNT-NO
                       DISPLAY "CUSTOMER NAME: "
                           FUNCTION TRIM(FD-CUSTOMER-NAME)
                       DISPLAY "ACCOUNT STATUS: "
                           FD-STATUS
                       DISPLAY "BALANCE: "
                           FD-BALANCE
               END-READ
           END-PERFORM
           CLOSE CUSTOMER-FILE
           DISPLAY "CUSTOMER FILE SUMMARY"
           DISPLAY "TOTAL CUSTOMERS: " WS-COUNT
           DISPLAY "TOTAL BALANCE: "
               WS-TOTAL-BALANCE
           DISPLAY "FILE PROCESSING COMPLETED"
           STOP RUN.
