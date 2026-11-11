       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLETEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-TABLE.
          05 WS-NUMBER OCCURS 5 TIMES
             INDEXED BY WS-IDX PIC 99.

       PROCEDURE DIVISION.

           MOVE 10 TO WS-NUMBER(1)
           MOVE 20 TO WS-NUMBER(2)
           MOVE 30 TO WS-NUMBER(3)
           MOVE 40 TO WS-NUMBER(4)
           MOVE 50 TO WS-NUMBER(5)
           DISPLAY "FORWARD ORDER"
           SET WS-IDX TO 1
           PERFORM 5 TIMES
               DISPLAY WS-NUMBER(WS-IDX)
               SET WS-IDX UP BY 1
           END-PERFORM
           DISPLAY "REVERSE ORDER"
           SET WS-IDX TO 5
           PERFORM 5 TIMES
               DISPLAY WS-NUMBER(WS-IDX)
               SET WS-IDX DOWN BY 1
           END-PERFORM
           STOP RUN.