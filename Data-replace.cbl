       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATACLEAN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-CUSTOMER-NAME PIC X(30).
       01 WS-PHONE PIC X(10).

       PROCEDURE DIVISION.

           DISPLAY "ENTER CUSTOMER NAME:"
           ACCEPT WS-CUSTOMER-NAME

           DISPLAY "ENTER PHONE NUMBER:"
           ACCEPT WS-PHONE

           DISPLAY " "
           DISPLAY "ORIGINAL CUSTOMER DETAILS"
           DISPLAY "--------------------------"

           DISPLAY "NAME: " WS-CUSTOMER-NAME
           DISPLAY "PHONE: " WS-PHONE

           INSPECT WS-CUSTOMER-NAME
               REPLACING ALL "@" BY SPACE

           INSPECT WS-PHONE
               REPLACING ALL "X" BY "0"

           DISPLAY " "
           DISPLAY "CORRECTED CUSTOMER DETAILS"
           DISPLAY "---------------------------"

           DISPLAY "NAME: "
                   FUNCTION TRIM(WS-CUSTOMER-NAME)

           DISPLAY "PHONE: " WS-PHONE

           STOP RUN.
