FROM ubuntu:22.04

# Basic dependencies
RUN apt update && apt install -y python3 python3-pip

# Application dependencies
RUN pip install flask hashids prometheus_client

# Create user and set permissions
RUN useradd kyrolles
RUN mkdir -p /opt/app/data && chown -R kyrolles:kyrolles /opt/app

USER kyrolles
WORKDIR /opt/app

# Copy application code
COPY --chown=kyrolles:kyrolles app.py .

EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]