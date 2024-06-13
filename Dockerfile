# Use an official Miniconda runtime as a parent image
FROM continuumio/miniconda3

# Set the working directory to /app
WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
RUN conda install --file requirements.txt
# RUN conda install -c conda-forge notebook jupyter -y --quiet

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run Jupyter Notebook without authentication
CMD ["jupyter", "notebook", "--notebook-dir=/app/notebooks", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]