function! branch_name#get_current_branch_name() abort
  let l:gitdir = s:find_git_dir(expand('%:p'))
  let l:ret = s:get_current_branch_name(l:gitdir)
  return l:ret
endfunction


function! branch_name#get_current_repo_root_name() abort
  let l:gitdir = s:find_git_dir(expand('%:p'))
  let l:ret = s:get_dirname(l:gitdir)
  return l:ret
endfunction


function! s:find_git_dir(fullpath) abort
  let l:gitdir = finddir('.git', escape(a:fullpath, ' ') . ';', 1)
  return l:gitdir
endfunction


function! s:get_dirname(gitdir) abort
  if empty(a:gitdir)
    return ''
  endif

  let l:ret = fnamemodify(a:gitdir, ":t")
  return l:ret
endfunction


function! s:get_current_branch_name(gitdir) abort
  if empty(a:gitdir)
    return ''
  endif

  let l:headcontent = readfile(a:gitdir . '/HEAD')
  let l:branch = substitute(l:headcontent[0], 'ref: refs/heads/', '', '')
  return branch
endfunction
