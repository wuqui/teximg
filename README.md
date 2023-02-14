This is a Quarto filter that allows you to use LaTeX code in your Quarto documents and render them to different formats, such as PDF, HTML, or DOCX.


# Requirements and configuration

- `pdf2svg` is required
- install this filter using `quarto add wuqui/teximg`
- activate it using

    ```yml
    filters:
      treesclean
    ```

- if you have any LaTeX requirements, add them to a `preamble.sty` file in your quarto folder


# Functionality

Here is a diagram using the `LaTeX`’s `forest` library:

````md
```{=tex}
\begin{forest}
  [one
    [two]
    [three]
  ]
\end{forest}
```
````

When rendering to PDF via LaTeX, this filter passes the code on to the LaTeX process.

When rendering to other formats, the filter:

- checks if the image file has already been produced; if not:
- produces a standalone PDF of this block,
- converts it to SVG using pdf2svg,
- inserts this image in the output file.
