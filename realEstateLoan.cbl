       IDENTIFICATION DIVISION.
       PROGRAM-ID. realEstateLoan.
       AUTHOR. Axel.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  RATE PIC 99V99 VALUE 1.20.
       01  YEAR PIC 99.
       01  LOANED_AMOUNT PIC 9(9).
       01  LOANED_AMOUNT_DISPLAY PIC ZZZbZZZbZZZ.
       01  TOTAL_AMOUNT PIC 9(10)V99.
       01  TOTAL_AMOUNT_DISPLAY PIC ZbZZZbZZZbZZZ.
       01  MONTHLY_PAYMENT PIC 9(9)V99.
       01  MONTHLY_PAYMENT_DISPLAY PIC ZZZbZZZbZZZ.99.
       01  MONTH_YEAR PIC 99 VALUE 12.
       01  NUMBER_MONTHLY_PAYMENT PIC 9(4).
       01  MONTHLY_RATE PIC 9V9(6).

       PROCEDURE DIVISION.

           DISPLAY 'Bienvenue sur le calculateur de prêt immobilier'.
           DISPLAY 'Sur combien d''année souhaitez-vous emprunter ?'.
           ACCEPT YEAR. 

           DISPLAY 'Quel montant souhaitez-vous emprunter sur ' YEAR,
           ' année(s).'.
           ACCEPT LOANED_AMOUNT.
           MOVE LOANED_AMOUNT TO LOANED_AMOUNT_DISPLAY.
           DISPLAY 'Très bien, nous calculons vos mensualités pour ',
           'votre crédit de ' LOANED_AMOUNT_DISPLAY '€'.  

           MULTIPLY YEAR BY MONTH_YEAR GIVING NUMBER_MONTHLY_PAYMENT.

           COMPUTE MONTHLY_RATE ROUNDED = (1 + RATE / 100) ** (1 / ,
           MONTH_YEAR) - 1.

           COMPUTE MONTHLY_PAYMENT = (LOANED_AMOUNT * MONTHLY_RATE *,
           (1 + MONTHLY_RATE) ** NUMBER_MONTHLY_PAYMENT) / ((1 + ,
           MONTHLY_RATE) ** NUMBER_MONTHLY_PAYMENT - 1).

           MOVE MONTHLY_PAYMENT TO MONTHLY_PAYMENT_DISPLAY.

           COMPUTE TOTAL_AMOUNT = MONTHLY_PAYMENT *,
           NUMBER_MONTHLY_PAYMENT. 

           MOVE TOTAL_AMOUNT TO TOTAL_AMOUNT_DISPLAY.

           DISPLAY 'Vos mensualités seront de ' MONTHLY_PAYMENT_DISPLAY,
           ' €. Soit un coup total de 'TOTAL_AMOUNT_DISPLAY ' €'.

           STOP RUN.
