FROM python:3.7-slim

WORKDIR /postgres-demo-notebook

RUN ls

COPY  requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]