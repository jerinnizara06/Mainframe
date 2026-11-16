       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPDATE-STOCK.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ITEM-MASTER ASSIGN TO "ITEMMASTER"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS ITEM-ID
               FILE STATUS IS WS-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD ITEM-MASTER.
       01 ITEM-REC.
          05 ITEM-ID          PIC X(08).
          05 ITEM-NAME        PIC X(10).
          05 ITEM-STOCK-QTY   PIC 9(05).
       WORKING-STORAGE SECTION.
       01 WS-STATUS           PIC X(02).
       01 WS-SOLD-QTY         PIC 9(05) VALUE 00025.
       01 WS-EOF              PIC X VALUE 'N'.
       01 WS-FOUND            PIC X VALUE 'N'.
       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN I-O ITEM-MASTER
           IF WS-STATUS = '00'
               PERFORM UNTIL WS-EOF = 'Y'
                   READ ITEM-MASTER NEXT RECORD
                       AT END
                           MOVE 'Y' TO WS-EOF
                       NOT AT END
                           IF ITEM-ID = 'SKU00412'
                               MOVE 'Y' TO WS-FOUND
                               IF ITEM-STOCK-QTY >= WS-SOLD-QTY
                                   SUBTRACT WS-SOLD-QTY
                                       FROM ITEM-STOCK-QTY
                                   REWRITE ITEM-REC
                                   IF WS-STATUS = '00'
                                       DISPLAY 'STOCK UPDATED'
                                       DISPLAY 'ITEM ID: '
                                           ITEM-ID
                                       DISPLAY 'ITEM NAME: '
                                           ITEM-NAME
                                       DISPLAY 'NEW STOCK: '
                                           ITEM-STOCK-QTY
                                   ELSE
                                       DISPLAY 'REWRITE ERROR: '
                                           WS-STATUS
                                   END-IF
                               ELSE
                                   DISPLAY 'INSUFFICIENT STOCK'
                               END-IF
                           END-IF
                   END-READ
               END-PERFORM
               IF WS-FOUND = 'N'
                   DISPLAY 'ITEM NOT FOUND'
               END-IF
               CLOSE ITEM-MASTER
           ELSE
               DISPLAY 'FILE OPEN ERROR: ' WS-STATUS
           END-IF.
           STOP RUN.
