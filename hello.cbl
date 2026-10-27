```
          IDENTIFICATION DIVISION.
          PROGRAM-ID. HELLO.

          DATA DIVISION.
          WORKING-STORAGE SECTION.
          01 WS-RT PIC 99.
          01 WS-AM PIC 9(8).
          01 WS-T PIC 99.
          01 WS-AI PIC 9(9)V99.
          01 WS-TOTAL PIC 9(9)V99.
          01 WS-INTEREST PIC Z(8)9.99. 
          01 WS-TOTAL_AMT PIC Z(8)9.99.
           
          PROCEDURE DIVISION.
              DISPLAY "ENTER THE AMOUNT"
              ACCEPT WS-AM
              DISPLAY "ENTER THE RATE" 
              ACCEPT WS-RT
              DISPLAY "ENTER THE TIME"
              ACCEPT WS-T
              IF (WS-AM>0 AND WS-AM < 10000000) AND (WS-RT>0 AND WS-RT <
               100) AND (WS-T>0 AND WS-T < 100)
                  COMPUTE WS-AI = (WS-AM * WS-RT * WS-T)/100
                  MOVE WS-AI TO WS-INTEREST
                  DISPLAY "INTEREST : " FUNCTION TRIM(WS-INTEREST)
                  COMPUTE WS-TOTAL = WS-AM + WS-AI
                  MOVE WS-TOTAL TO WS-TOTAL_AMT
                  DISPLAY "TOTAL AMOUNT : " FUNCTION TRIM(WS-TOTAL_AMT)
              ELSE
                  DISPLAY "INVAID INPUTS"   
              END-IF
              STOP RUN.




```
