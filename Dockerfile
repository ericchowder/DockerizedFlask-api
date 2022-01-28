FROM python:3.9.1

WORKDIR /app
# Copies files from current folder in HOST to /app in CONTAINER
COPY . .

# RUN pip install -r requirements.txt
# We're using pipenv instead of requirements.txt
RUN pip install pipenv
# --system tells pipenv to install on (container's) system instead of virtualenv
# --deploy tells pipenv to blow up if lockfile out of date (if pipfile doesnt match lock) 
RUN pipenv install --system --deploy

ENTRYPOINT ["python"]
CMD ["app.py"]

