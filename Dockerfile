# Use jupyter's minimal-notebook image as a base
FROM jupyter/minimal-notebook

# Run as root user
USER root

# Remove default python kernel
RUN jupyter kernelspec remove -f python3

# Install Jupyter extensions
RUN pip install trame-jupyter-extension ipywidgets

# Create conda environment with gospl
ADD deps/environment.yml .
RUN mamba env create -f environment.yml
RUN rm environment.yml

# Activate conda environment
SHELL ["conda", "run", "-n", "gospl", "/bin/bash", "-c"]

# Install python kernel
RUN python -m ipykernel install --name python3 --display-name "gospl"

# Switch back to regular shell
SHELL ["/bin/bash", "-c"]

# Create directories for notebook
RUN mkdir /notebook
RUN mkdir /notebook/inputs
RUN mkdir /notebook/output

VOLUME /notebook/inputs
VOLUME /notebook/output

WORKDIR /notebook

# Add erosionpasta files
ADD deps/erosionpasta .

# Set up conda runtime environment
RUN conda init
RUN echo 'conda activate gospl' >> ~/.bashrc
ENV PATH=/opt/conda/envs/gospl/bin:$PATH

# Run jupyter server
ENV NOTEBOOK_PASSWORD=''
EXPOSE 8888/tcp
ENTRYPOINT ["jupyter", "notebook", "--allow-root","--ip=0.0.0.0","--NotebookApp.password=${NOTEBOOK_PASSWORD}"]
