##FROM continuumio/miniconda3
#FROM python:3.7
##FROM jupyter/scipy-notebook
#
#RUN apt-get update && apt-get -y upgrade
##RUN conda install python==3.7.0
#
#RUN useradd -ms /bin/bash jetscape
#
#USER jetscape
#WORKDIR /home/jetscape
#
##RUN curl -O https://bootstrap.pypa.io/get-pip.py
#
##WORKDIR /usr/src/app
##ORKDIR /home/jovyan
#
##COPY requirements.txt ./
##RUN pip install --no-cache-dir -r requirements.txt
##ENV PATH="/home/jovyan/.local/bin:${PATH}"
#ENV PATH="/home/jetscape/.local/bin:${PATH}"
#RUN pip3 install --user numpy scipy matplotlib dill h5py hsluv plotly altair seaborn SALib streamlit emcee ptemcee
##RUN pip install --upgrade protobuf
#
FROM bardelch/jetscapesims:base
RUN git clone https://github.com/j-f-paquet/js-sims-bayes.git && cd js-sims-bayes && sh prepare_for_widget.sh

#COPY . .

EXPOSE 8501
RUN echo "cd js-sims-bayes; streamlit  run src/streamlit_widget.py "  > entrypoint.sh && chmod +x entrypoint.sh


#ENTRYPOINT [" /home/jovyan/entrypoint.sh "]
CMD [" ./entrypoint.sh "]

#CMD [" streamlit ", " run js-sims-bayes/src/streamlit_widget.py " ]
#ENTRYPOINT [" streamlit run js-sims-bayes/src/streamlit_widget.py " ]
#CMD [ "python", "./your-daemon-or-script.py" ]
