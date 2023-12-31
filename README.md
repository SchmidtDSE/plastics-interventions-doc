Plastic Interventions Docs
================================================================================
Sources for supplemental materials which are included in https://global-plastics-tool.org/ and describe how each policy intervention or "lever" works.

<br>

Purpose
--------------------------------------------------------------------------------
To further document the interventions and provide context for their provided code, this repository houses a number of documents which are built and deployed into the UI. This offers supplemental materials and a narrative for how each policy intervention or "policy lever" works. These are available under the second "details" tab.

<br>

Usage
--------------------------------------------------------------------------------
These can be reviewed in the "more information" sections for each lever in the [detailed section](https://global-plastics-tool.org/#detailed). They are also indexed in the [table of contents](https://global-plastics-tool.org/#toc).

<br>

Environment Setup
--------------------------------------------------------------------------------
It is recommended that these are built through [Pandoc](https://pandoc.org/) though any tool which can process Markdown files can be used. If using Pandoc, after installation simply run `bash build.sh` after installation. Note that the default build also requires Latex. In Ubuntu:

```
sudo apt-get install pandoc pandoc-citeproc texlive-extra-utils texlive-fonts-recommended texlive-latex-base texlive-latex-extra texlive-bibtex-extra biber
```

<br>

Deployment
--------------------------------------------------------------------------------
Merging to the `deploy` branch will cause the files to be built and sent to the tool.

<br>

Open Source
--------------------------------------------------------------------------------
These materials are available under the CC-BY-NC license. See [LICENSE.md](https://github.com/SchmidtDSE/plastics-interventions-doc/blob/main/LICENSE.md).

Though other tools may be used to build these materials, CI / CD pipelines or users may invoke [Pandoc](https://pandoc.org/) as an executable which is released under the [GPL v3 License](https://www.gnu.org/licenses/gpl-3.0.html).
