XPTemplate priority=personal

XPTinclude
    \ _common/personal
    \ php/php
    \ _printf/c.like


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

XPTinclude
      \ _condition/c.like
      \ _loops/c.while.like

XPTembed
      \ html/html
      \ html/php*



if exists( 'php_noShortTags' )
    XPTvar $PHP_TAG php
else
    XPTvar $PHP_TAG
endif

XPT html " <?$PHP_TAG ... ?>
?>`html^<?`$PHP_TAG^


XPT foreach " foreach (.. as ..) {..}
foreach ($`var^ as `container^)`$BRloop^{
    `cursor^
}


XPT fun " function ..( .. ) {..}
XSET params=Void()
XSET params|post=EchoIfEq('  ', '')
function `funName^(` `params` ^)`$BRfun^{
    `cursor^
}


XPT myclass " class .. { .. }
class `className^`$BRfun^{
    function __construct( `args^ )`$BRfun^{
        `cursor^
    }
}


XPT interface " interface .. { .. }
interface `interfaceName^`$BRfun^{
    `cursor^
}

XPT $ " make dollar a keyword
$


XPT aai "Items Assigned    │ 'key' => 'val', ...
`'`on^' => '`post^'`...^, `'`on^' => '`post^'`...^

XPT ai  "items / args      │ 'args', ...
`arg^`...^, `arg^`...^`cursor^


XPT arr "Array Unassigned  │ array ('args', ...)
array (`arg^`...^, `arg^`...^)`cursor^


XPT aar "Array Assigned    │ array ('key' => 'val', ...)
array (`'`on^' => '`post^'`...^, `'`on^' => '`post^'`...^)`cursor^

XPTvar $S      '  '
XPT aarn "Array Assigned    │ array ('key' => 'val',\n ...)
array (
`'`on^' => '`post^'`...^,
`'`on^' => '`post^'`...^
)`cursor^

XPT wname wrap=wrapped
`name^(`wrapped^`, `^)`cursor^


XPT para syn=comment
@param {`Object^} `name^ `desc^


XPT /** wrap=what
 /**
  `* `what`^
  */


XPT /* wrap=what
`/* `what` */^


XPT // wrap=what
`// `what`^



XPT nst "nested snippet test"
{S("abc", '.', '\u&')}

XPT #ind
XSET me|def=fileRoot()
#include "`me^.h"


XPT #ifndef hint=#ifndef\ ..
XSET symbol=S(fileRoot(),'\.','_','g')
XSET symbol|post=UpperCase(V())
#ifndef `symbol^
#     define `symbol^

`cursor^ 
#endif `$CL^ `symbol^ `$CR^
..XPT
