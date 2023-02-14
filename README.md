# Requirements and configuration

- `pdf2svg`
- Use a `preamble.sty` file in your quarto folder to specify your LaTeX requirements.


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
