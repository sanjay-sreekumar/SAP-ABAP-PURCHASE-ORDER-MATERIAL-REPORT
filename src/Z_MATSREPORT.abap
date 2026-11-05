REPORT Z_MATSREPORT.

TYPE-POOLS: slis.

TYPES: BEGIN OF ty_report,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         txz01 TYPE ekpo-txz01,
         maktx TYPE makt-maktx,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
         netpr TYPE ekpo-netpr,
       END OF ty_report.

DATA: it_report TYPE TABLE OF ty_report,
      wa_report TYPE ty_report.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

PARAMETERS: p_ebeln TYPE ekpo-ebeln,
            p_matnr TYPE ekpo-matnr.

START-OF-SELECTION.

SELECT e~ebeln,
       e~ebelp,
       e~matnr,
       e~txz01,
       m~maktx,
       e~menge,
       e~meins,
       e~netpr
  FROM ekpo AS e
  LEFT OUTER JOIN makt AS m
    ON m~matnr = e~matnr
   AND m~spras = @sy-langu
  WHERE ( e~ebeln = @p_ebeln OR @p_ebeln IS INITIAL )
    AND ( e~matnr = @p_matnr OR @p_matnr IS INITIAL )
  INTO CORRESPONDING FIELDS OF TABLE @it_report.

  CLEAR wa_fieldcat.

wa_fieldcat-fieldname = 'EBELN'.
wa_fieldcat-seltext_m = 'Purchase Order'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'EBELP'.
wa_fieldcat-seltext_m = 'Item Number'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'MATNR'.
wa_fieldcat-seltext_m = 'Material Number'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'MAKTX'.
wa_fieldcat-seltext_m = 'Material Description'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'MENGE'.
wa_fieldcat-seltext_m = 'Quantity'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'MEINS'.
wa_fieldcat-seltext_m = 'Unit'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'NETPR'.
wa_fieldcat-seltext_m = 'Net Price'.
APPEND wa_fieldcat TO it_fieldcat.

IF it_report IS INITIAL.

  WRITE: / 'No Purchase Order data found'.

ELSE.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      it_fieldcat        = it_fieldcat
    TABLES
      t_outtab           = it_report
    EXCEPTIONS
      program_error     = 1
      OTHERS            = 2.

  IF sy-subrc <> 0.
    WRITE: / 'Error displaying ALV report'.
  ENDIF.

ENDIF.
