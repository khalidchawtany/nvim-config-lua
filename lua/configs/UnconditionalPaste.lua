local M = {
    keys = {
        'gPP', 'gPp', 'gpP', 'gpp', 'gUP', 'gUp', 'guP', 'gup', 'gQP', 'gQp', 'gqP', 'gqp', 'gQBP', 'gQBp', 'gqbP', 'gqbp', 'gBP', 'gBp', 'gsP',
        'g]p', 'g[p', 'g[P', 'g]P', 'g>P', 'g>p', 'gsp', 'g#P', 'g#p', 'g,P', 'g,p', 'gbP', 'gbp', 'glP', 'glp', 'gcP', 'gcp', 'g,"P', 'g,"p',
        'g,\'P', 'g,\'p'
    }
    --  'g\\[\\[P', 'g\\[\\[p', 'g\\]\\]P', 'g\\]\\]p'
}

M.config = function()

    vim.cmd [[
    Map n gPP     <Plug>UnconditionalPasteGPlusBefore
    Map n gPp     <Plug>UnconditionalPasteGPlusAfter
    Map n gpP     <Plug>UnconditionalPastePlusBefore
    Map n gpp     <Plug>UnconditionalPastePlusAfter
    Map n gUP     <Plug>UnconditionalPasteRecallUnjoinBefore
    Map n gUp     <Plug>UnconditionalPasteRecallUnjoinAfter
    Map n guP     <Plug>UnconditionalPasteUnjoinBefore
    Map n gup     <Plug>UnconditionalPasteUnjoinAfter
    Map n gQP     <Plug>UnconditionalPasteRecallQueriedBefore
    Map n gQp     <Plug>UnconditionalPasteRecallQueriedAfter
    Map n gqP     <Plug>UnconditionalPasteQueriedBefore
    Map n gqp     <Plug>UnconditionalPasteQueriedAfter
    Map n gQBP    <Plug>UnconditionalPasteRecallDelimitedBefore
    Map n gQBp    <Plug>UnconditionalPasteRecallDelimitedAfter
    Map n gqbP    <Plug>UnconditionalPasteDelimitedBefore
    Map n gqbp    <Plug>UnconditionalPasteDelimitedAfter
    Map n gBP     <Plug>UnconditionalPasteJaggedBefore
    Map n gBp     <Plug>UnconditionalPasteJaggedAfter
    Map n gsP     <Plug>UnconditionalPasteSpacedBefore
    Map n gsp     <Plug>UnconditionalPasteSpacedAfter
    Map n g#P     <Plug>UnconditionalPasteCommentedBefore
    Map n g#p     <Plug>UnconditionalPasteCommentedAfter
    Map n g>P     <Plug>UnconditionalPasteShiftedBefore
    Map n g>p     <Plug>UnconditionalPasteShiftedAfter
    Map n g[[P    <Plug>UnconditionalPasteLessIndentBefore
    Map n g[[p    <Plug>UnconditionalPasteLessIndentAfter
    Map n g\]\]P  <Plug>UnconditionalPasteMoreIndentBefore
    Map n g\]\]p  <Plug>UnconditionalPasteMoreIndentAfter
    Map n g]p     <Plug>UnconditionalPasteIndentedAfter
    Map n g[p     <Plug>UnconditionalPasteIndentedBefore
    Map n g[P     <Plug>UnconditionalPasteIndentedBefore
    Map n g]P     <Plug>UnconditionalPasteIndentedBefore
    Map n g,"P    <Plug>UnconditionalPasteCommaDoubleQuoteBefore
    Map n g,"p    <Plug>UnconditionalPasteCommaDoubleQuoteAfter
    Map n g,'P    <Plug>UnconditionalPasteCommaSingleQuoteBefore
    Map n g,'p    <Plug>UnconditionalPasteCommaSingleQuoteAfter
    Map n g,P     <Plug>UnconditionalPasteCommaBefore
    Map n g,p     <Plug>UnconditionalPasteCommaAfter
    Map n gbP     <Plug>UnconditionalPasteBlockBefore
    Map n gbp     <Plug>UnconditionalPasteBlockAfter
    Map n glP     <Plug>UnconditionalPasteLineBefore
    Map n glp     <Plug>UnconditionalPasteLineAfter
    Map n gcP     <Plug>UnconditionalPasteCharBefore
    Map n gcp     <Plug>UnconditionalPasteCharAfter
    ]]
end

return M

