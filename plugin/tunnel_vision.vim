if exists('g:loaded_tunnel_vision')
  finish
endif
let g:loaded_tunnel_vision = 1

function! s:tunnel_vision_enter(type, ...)
  if a:0 " visual mode
    let l:start = line("'<")
    let l:end = line("'>")

  else
    let l:start = line("'[")
    let l:end = line("']")
  endif

  let l:ft = &ft

  let l:original_buffer = bufnr('%')

  let l:original_lines = getline(l:start, l:end)

  let l:focus_file = tempname()

  call writefile(l:original_lines, l:focus_file)

  exec "e " . l:focus_file

  let b:start = l:start
  let b:end = l:end
  let b:original_buffer = l:original_buffer

  exec "setl ft=" . l:ft
  setl hidden bh=delete

  autocmd BufWriteCmd <buffer> :call s:tunnel_vision_exit()
endfunction

function! s:tunnel_vision_exit()
  let l:new_lines = getline(1, '$')
  let l:cursor_pos = getpos('.')

  let l:start = b:start
  let l:end = b:end

  write

  exec "b " . b:original_buffer

  exec l:start . "," . l:end . "d"
  call append(l:start - 1, l:new_lines)

  call cursor(l:cursor_pos[1] + l:start - 1, l:cursor_pos[2])
endfunction

vnoremap <silent> <Plug>(EnterTunnel) :<C-U>call <SID>tunnel_vision_enter(visualmode(), 1)<Enter>
nnoremap <silent> <Plug>(EnterTunnel) :set opfunc=<SID>tunnel_vision_enter<Enter>g@
