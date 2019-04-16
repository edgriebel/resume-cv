FROM blang/latex:ubuntu

# Only needed if run from inside corp firewall
# RUN echo 'Acquire::http::Proxy "http://185.46.212.88:80";' > /etc/apt/apt.conf.d/99proxy

RUN apt update

# there's ~50-100 packages that need to be updated with blang image and it takes too long
# RUN apt upgrade -y

# If directory is mapped and no git happening from action then this isn't needed
# RUN apt install git -y

# Not needed with blang/latex:ubuntu because texlive-full included
# RUN apt install texlive-xetex -y

RUN apt install -y imagemagick

# Container builds pdf file and then exits
CMD cd resume-cv; latexmk -xelatex Ed_Griebel_CV.tex && convert -density 150 -quality 90 -background white -alpha remove -alpha off Ed_Griebel_CV.pdf Miscellaneous/Ed_Griebel_CV.png
