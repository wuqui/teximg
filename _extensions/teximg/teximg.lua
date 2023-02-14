local system = require 'pandoc.system'

local tikz_doc_template = [[
\documentclass{standalone}
\usepackage{xcolor}
\usepackage{preamble}
\begin{document}
\nopagecolor
%s
\end{document}
]]

local function tikz2image(src, filetype, outfile)
  -- use os.execute to create the att/ directory if it doesn't exist
  os.execute("mkdir -p att")
  local f = io.open('tmp_tex.tex', 'w')
  f:write(tikz_doc_template:format(src))
  f:close()
  os.execute('xelatex tmp_tex.tex')
  if filetype == 'pdf' then
    os.rename('tmp_tex.pdf', "att/" .. outfile)
  else
    os.execute('pdf2svg tmp_tex.pdf ' .. outfile)
    os.rename(outfile, "att/" .. outfile)
  end
  -- use os.remove to delete the temporary files
  os.remove('tmp_tex.aux')
  os.remove('tmp_tex.log')
  os.remove('tmp_tex.pdf')
  os.remove('tmp_tex.tex')
end

extension_for = {
  html = 'svg',
  html4 = 'svg',
  html5 = 'svg',
  latex = 'pdf',
  beamer = 'pdf' }

local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function starts_with(start, str)
  return str:sub(1, #start) == start
end


function RawBlock(el)
  if starts_with('\\begin{forest}', el.text) then
    if FORMAT == 'latex' then
      -- return the block as raw latex
      return el
    else
      -- return the image element for all other formats
      local filetype = extension_for[FORMAT] or 'svg'
      local fbasename = 'att/' .. pandoc.sha1(el.text) .. '.' .. filetype
      local fname = system.get_working_directory() .. '/' .. fbasename
      if not file_exists(fname) then
        tikz2image(el.text, filetype, fname)
      end
      return pandoc.Para({pandoc.Image({}, fbasename)})
    end
  end
end
