This is a Quarto filter that allows you to use LaTeX code in your Quarto documents and render them to different formats, such as PDF, HTML, or DOCX.


# Requirements and configuration

- pdf2svg
- Use a preamble.sty file in your quarto folder to specify your LaTeX requirements.


# Example

Here is a diagram using the LaTeX forest library:

```{=tex}
\begin{forest}
  [one
    [two]
    [three]
  ]
\end{forest}
```

When rendering to PDF, this filter leaves the raw LaTeX.

When rendering to other formats, the filter

- produces a standalone PDF of this block,
- converts it to SVG using pdf2svg,
- inserts this image in the output file


# Features

This filter has the following features:

- Supports any LaTeX code that can be compiled with XeLaTeX
- Converts LaTeX code to SVG images for non-PDF formats
- Allows you to customize the preamble



# Example

Here is a diagram using the `LaTeX` `forest` library:

```{=tex}
\begin{forest}
  [one
    [two]
    [three]
  ]
\end{forest}
```

When rendering to `pdf`, this filter leaves the raw LaTeX.

When rendering to other formats, the filter

- produces a standalone `pdf` of this block,
- converts it to `svg` using `pdf2svg`,
- inserts this image in the output file
