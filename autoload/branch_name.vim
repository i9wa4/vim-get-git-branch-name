function! branch_name#get_current_branch_name()
  let l:gitdir = s:find_git_dir(expand('%:p'))
  return s:get_current_branch_name(l:gitdir)
endfunction


function! branch_name#get_current_repo_root_name()
  let l:gitdir = s:find_git_dir(expand('%:p'))
  return s:get_dirname(l:gitdir)
endfunction


function! s:find_git_dir(fullpath)
  let l:gitdir = finddir('.git', escape(a:fullpath, ' ') . ';', 1)
  return l:gitdir
endfunction


function! s:get_dirname(gitdir)
  if (empty(a:gitdir))
    return ''
  endif

  let l:ret = fnamemodify(a:gitdir, ":t")
  return l:ret
endif


function! s:get_current_branch_name(gitdir)
  if (empty(a:gitdir))
    return ''
  endif

  let l:headcontent = readfile(a:gitdir . '/HEAD')
  let l:branch = substitute(l:headcontent[0], 'ref: refs/heads/', '', '')
  return l:branch
endfunction
