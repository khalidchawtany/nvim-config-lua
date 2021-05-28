XPTemplate priority=personal

XPTinclude
    \ _common/personal


let s:f = g:XPTfuncs()

XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     null

XPTvar $VOID_LINE      /* void */;
XPTvar $CURSOR_PH      /* cursor */

XPTvar $BRif          ' '
XPTvar $BRel          \n
XPTvar $BRloop        ' '
XPTvar $BRstc         ' '
XPTvar $BRfun         ' '

XPTinclude
      \ _common/common

XPTvar $CL    /*
XPTvar $CM    *
XPTvar $CR    */
XPTinclude
      \ _comment/doubleSign

XPTvar $VAR_PRE   $
XPTvar $FOR_SCOPE
XPTinclude
      \ _loops/for


XPTembed
      \ html/html
      \ html/php*


XPT /< wrap=what
`<-- `what` -->^



