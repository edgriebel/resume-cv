FROM ubuntu:jammy

# Only needed if run from inside corp firewall
# RUN echo 'Acquire::http::Proxy "http://185.46.212.88:80";' > /etc/apt/apt.conf.d/99proxy

RUN apt-get update && apt-get upgrade -y && apt-get install -y perl wget libfontconfig1 make && \
	wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh && \
	apt-get clean

# If directory is mapped and no git happening from action then this isn't needed
# RUN apt install git -y

ENV PATH="${PATH}:/root/bin"

RUN tlmgr install xetex
RUN fmtutil-sys --all

RUN tlmgr install hyphenat tracklang xltxtra realscripts

# ghostscript is not germane to creating tex->pdf so putting this at the end
RUN apt-get install -y ghostscript

# Container builds pdf file and then exits
## CMD cd resume-cv; latexmk -xelatex Ed_Griebel_CV.tex && convert -density 150 -quality 90 -background white -alpha remove -alpha off Ed_Griebel_CV.pdf Miscellaneous/Ed_Griebel_CV.png
