FROM python:3.9-slim

RUN mkdir /code

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["uvicorn", "app:rmsai", "--host=0.0.0.0", "--port=80"]