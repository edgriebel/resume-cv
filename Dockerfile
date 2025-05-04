FROM ubuntu

# Only needed if run from inside corp firewall
# RUN echo 'Acquire::http::Proxy "http://185.46.212.88:80";' > /etc/apt/apt.conf.d/99proxy

# Lots of hash errors for apt install, this fixed it: https://stackoverflow.com/a/76092743
RUN echo 'Acquire::http::Pipeline-Depth 0;' >> /etc/apt/apt.conf.d/99fixbadproxy; \
	echo 'Acquire::http::No-Cache true;' >> /etc/apt/apt.conf.d/99fixbadproxy; \
	echo 'Acquire::BrokenProxy true;' >> /etc/apt/apt.conf.d/99fixbadproxy

# These should be in the same RUN but getting lots of hash errors.
# Splitting them allows a faster re-run on the packages once the base image is upgraded
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y perl wget libfontconfig1 make ghostscript && apt-get clean

RUN wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh 

# If directory is mapped and no git happening from action then this isn't needed
# RUN apt install git -y

ENV PATH="${PATH}:/root/bin"

RUN tlmgr install xetex
RUN fmtutil-sys --all

RUN tlmgr install hyphenat tracklang xltxtra realscripts detex

# Container builds pdf file and then exits
## CMD cd resume-cv; latexmk -xelatex Ed_Griebel_CV.tex && convert -density 150 -quality 90 -background white -alpha remove -alpha off Ed_Griebel_CV.pdf Miscellaneous/Ed_Griebel_CV.png
