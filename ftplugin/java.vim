set ts=4 " Tabs are 2 spaces
set shiftwidth=4 " Tabs under smart indent

   
set nolist "Disable whitespace chars

"" eclim
" Search for the javadocs of the element under the cursor with <leader>d
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>

" Perform a context sensitive search of the element under the cursor with <enter>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>


let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
