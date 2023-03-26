FROM python:3.9-slim

RUN pip install --upgrade pip

RUN mkdir /nutri

WORKDIR /nutri

COPY requirements.txt .

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN pip --no-cache-dir install -r requirements.txt

COPY . .

CMD ["uvicorn", "app:rmsai", "--host=0.0.0.0", "--port=80"]