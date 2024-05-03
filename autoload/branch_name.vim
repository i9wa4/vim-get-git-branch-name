function! branch_name#get_current_branch_name()
  let l:gitdir = s:find_git_dir(expand('%:p'))
  let l:branch = s:get_current_branch_name(l:gitdir)
  return l:branch
endfunction


function! s:find_git_dir(fullpath)
  let l:gitdir = finddir('.git', escape(a:fullpath, ' ') . ';', 1)
  return l:gitdir
endfunction


function! s:get_current_branch_name(gitdir)
  if (empty(a:gitdir))
    return ''
  endif

  let l:headcontent = readfile(a:gitdir . '/HEAD')
  let l:branch = substitute(l:headcontent[0], 'ref: refs/heads/', '', '')
  return l:branch
endfunction
