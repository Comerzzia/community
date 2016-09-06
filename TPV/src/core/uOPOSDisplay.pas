//
// Copyright 2009-2011 RED.ES - Desarrollado por Tier1
// 
// Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
// sean aprobadas por la comisión Europea- versiones 
// posteriores de la EUPL (la "Licencia").
// Solo podrá usarse esta obra si se respeta la Licencia.
// 
// http://ec.europa.eu/idabc/eupl.html
// 
// Salvo cuando lo exija la legislación aplicable o se acuerde
// por escrito, el programa distribuido con arreglo a la
// Licencia se distribuye "TAL CUAL",
// SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
// ni expresas ni implícitas.
// Véase la Licencia en el idioma concreto que rige
// los permisos y limitaciones que establece la Licencia.
//

unit uOPOSDisplay;

interface

const
/////////////////////////////////////////////////////////////////////
// "CapBlink" Property Constants
/////////////////////////////////////////////////////////////////////

   DISP_CB_NOBLINK      = 0;
   DISP_CB_BLINKALL     = 1;
   DISP_CB_BLINKEACH    = 2;


/////////////////////////////////////////////////////////////////////
// "CapCharacterSet" Property Constants
/////////////////////////////////////////////////////////////////////

   DISP_CCS_NUMERIC     =   0;
   DISP_CCS_ALPHA       =   1;
   DISP_CCS_ASCII       = 998;
   DISP_CCS_KANA        =  10; // (added in 1.1)
   DISP_CCS_KANJI       =  11; // (added in 1.1)
   DISP_CCS_UNICODE     = 997; // (added in 1.5)


/////////////////////////////////////////////////////////////////////
// "CapCursorType" Property Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_CCT_NONE        =   $00000000;
   DISP_CCT_FIXED       =   $00000001;
   DISP_CCT_BLOCK       =   $00000002;
   DISP_CCT_HALFBLOCK   =   $00000004;
   DISP_CCT_UNDERLINE   =   $00000008;
   DISP_CCT_REVERSE     =   $00000010;
   DISP_CCT_OTHER       =   $00000020;
   DISP_CCT_BLINK       =   $00000040;  // (added in 1.8)


/////////////////////////////////////////////////////////////////////
// "CapReadBack" Property Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_CRB_NONE        =   $00000000;
   DISP_CRB_SINGLE      =   $00000001;


/////////////////////////////////////////////////////////////////////
// "CapReverse" Property Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_CR_NONE         =   $00000000;
   DISP_CR_REVERSEALL   =   $00000001;
   DISP_CR_REVERSEEACH  =   $00000002;


/////////////////////////////////////////////////////////////////////
// "CharacterSet" Property Constants
/////////////////////////////////////////////////////////////////////

   DISP_CS_UNICODE      = 997; // (added in 1.5)
   DISP_CS_ASCII        = 998;
   DISP_CS_WINDOWS      = 999;
   DISP_CS_ANSI         = 999; // (added in 1.5)


/////////////////////////////////////////////////////////////////////
// "CursorType" Property Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_CT_NONE         =   0;
   DISP_CT_FIXED        =   1;
   DISP_CT_BLOCK        =   2;
   DISP_CT_HALFBLOCK    =   3;
   DISP_CT_UNDERLINE    =   4;
   DISP_CT_REVERSE      =   5;
   DISP_CT_OTHER        =   6;
   DISP_CT_BLINK        =   $10000000;  // (added in 1.8)


/////////////////////////////////////////////////////////////////////
// "MarqueeType" Property Constants
/////////////////////////////////////////////////////////////////////

   DISP_MT_NONE         = 0;
   DISP_MT_UP           = 1;
   DISP_MT_DOWN         = 2;
   DISP_MT_LEFT         = 3;
   DISP_MT_RIGHT        = 4;
   DISP_MT_INIT         = 5; // (added in 1.01)


/////////////////////////////////////////////////////////////////////
// "MarqueeFormat" Property Constants (added in 1.01)
/////////////////////////////////////////////////////////////////////

   DISP_MF_WALK         = 0;
   DISP_MF_PLACE        = 1;


/////////////////////////////////////////////////////////////////////
// "DefineGlyph" Method: "GlyphType" Parameter Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_GT_SINGLE       = 1;


/////////////////////////////////////////////////////////////////////
// "DisplayText" Method: "Attribute" Property Constants (added in 1.6)
// "DisplayTextAt" Method: "Attribute" Property Constants (added in 1.6)
/////////////////////////////////////////////////////////////////////

   DISP_DT_NORMAL        = 0;
   DISP_DT_BLINK         = 1;
   DISP_DT_REVERSE       = 2;
   DISP_DT_BLINK_REVERSE = 3;


/////////////////////////////////////////////////////////////////////
// "ScrollText" Method: "Direction" Parameter Constants
/////////////////////////////////////////////////////////////////////

   DISP_ST_UP           = 1;
   DISP_ST_DOWN         = 2;
   DISP_ST_LEFT         = 3;
   DISP_ST_RIGHT        = 4;


/////////////////////////////////////////////////////////////////////
// "SetDescriptor" Method: "Attribute" Parameter Constants
/////////////////////////////////////////////////////////////////////

   DISP_SD_OFF          = 0;
   DISP_SD_ON           = 1;
   DISP_SD_BLINK        = 2;


/////////////////////////////////////////////////////////////////////
// "DisplayBitmap" and "SetBitmap" Method Constants (added in 1.7)
/////////////////////////////////////////////////////////////////////

//   "Width" Parameter

   DISP_BM_ASIS         = -11;

//   "AlignmentX" Parameter

   DISP_BM_LEFT         = -1;
   DISP_BM_CENTER       = -2;
   DISP_BM_RIGHT        = -3;

//   "AlignmentY" Parameter

   DISP_BM_TOP          = -1;
//   DISP_BM_CENTER     = -2;
   DISP_BM_BOTTOM       = -3;


/////////////////////////////////////////////////////////////////////
// "ResultCodeExtended" Property Constants
/////////////////////////////////////////////////////////////////////

   OPOS_EDISP_TOOBIG    = 201; // DisplayBitmap (added in 1.7)
   OPOS_EDISP_BADFORMAT = 202; // DisplayBitmap (added in 1.7)


implementation

end.
