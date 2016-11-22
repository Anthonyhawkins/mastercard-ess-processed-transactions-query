  SELECT /*+ FULL(PT) */
        PT.PRCSS_TRAN_ID,
         MPS_STRT_ACCT_RNG_NUM,
         MPS_ENDNG_ACCT_RNG_NUM,
         AUTH_ACCT_RNG_ID,
         PRCSS_DT_TM,
         DE2_PAN_NUM,
         SUBSTR ( DE22_POS_ENT_MODE_CD, 1, 2) AS posPANEntryMode,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 13, 6) AS caseKeyCode2,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 29, 1) AS numberOfEventsForMagneticStr3,
         DE48_SE87_MAGSTRIP_CVC_CD AS cardValidationCodeResult,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 28, 1) AS numberOfEventsForPIN,
         TRIM (SUBSTR ( DE43_CARD_ACPT_NAM_LOC, 24, 13)) AS merchantsCity,
         SUBSTR ( DE61_POS_DATA_TXT, 10, 1) AS cardholderActivatedTerminalL7,
         SUBSTR ( DE61_POS_DATA_TXT, 14, 3) AS posCountryCode,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 26, 1) AS numberOfEventsForExpirationD9,
         DE4_TRAN_AMT AS transactionAmount,
         SUBSTR ( DE61_POS_DATA_TXT, 11, 1) AS posCardDataTermInputCapabili11,
         SUBSTR ( DE3_PRCSS_CD, 1, 2) AS transactionType,
         DE42_CARD_ACPT_ID_CD AS cardAcceptorIdCode,
         DE48_SE20_CRDHLDR_VER_MTHD_CD AS cardholderVerificationMethod,
         DE18_MERCH_TYPE_CD AS merchantType,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 19, 6) AS caseKeyCode3,
         IPREVENT_SCR_NUM AS emsAdjustedScore,
         DE39_ISSR_RESP_CD AS responseCode,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 27, 1) AS numberOfEventsForCVC2,
         DE5_SETL_AMT AS settlementAmount,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 25, 1)
            AS numberOfEventsForAccountNumber,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 30, 1)
            AS numberOfEventsForPersonalInf22,
         IPREVENT_RSN_CD AS emsAdjustedReasonCode,
         SUBSTR ( DE48_SE39_ADC_DATA_TXT, 7, 6) AS caseKeyCode1,
         DE32_ACQ_INST_ID AS acquireInstitutionIdCode,
         SUBSTR ( DE43_CARD_ACPT_NAM_LOC, 38, 3) AS merchantsState,
         DE49_TRAN_CURR_CD AS transactionCurrencyCode,
         TRIM (SUBSTR ( DE43_CARD_ACPT_NAM_LOC, 1, 22)) AS merchantName,
         SUBSTR ( DE61_POS_DATA_TXT, 5, 1) AS posCardPresence,
         SUBSTR ( DE22_POS_ENT_MODE_CD, 3, 1) AS posPINEntryMode,
         DE41_CARD_ACPT_TERM_ID AS cardAcceptorTerminalId,
         SUBSTR ( DE61_POS_DATA_TXT, 4, 1) AS posCardholderPresence,
         DE6_BILL_AMT AS cardholderBillingAmount
    FROM RDR_OWNER.PROCESSED_TRAN PT
   WHERE     PT.PRCSS_DT_TM >= TO_DATE ( :b3, 'MM/dd/yyyy HH24:mi:ss')
         AND PT.PRCSS_DT_TM <= TO_DATE ( :b4, 'MM/dd/yyyy HH24:mi:ss')
         AND PT.AUTH_ACCT_RNG_ID IN
                (5739,
                 6404,
                 6405,
                 139725,
                 100416,
                 104223,
                 80385,
                 8850,
                 8851,
                 8854,
                 47161,
                 96428,
                 125223,
                 109459,
                 9139,
                 9140,
                 9173,
                 41906,
                 9174,
                 11471,
                 11472,
                 11473,
                 19355,
                 23031)
         AND PT.CUST_CLSTR_ID IN (1, 2, 3)
ORDER BY PRCSS_DT_TM;