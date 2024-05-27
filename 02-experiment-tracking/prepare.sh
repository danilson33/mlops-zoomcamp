conda create -n exp-tracking-env python=3.9
conda activate exp-tracking-env
pip install -r requirements.txt 
wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-01.parquet -P data/
wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-02.parquet -P data/
wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-03.parquet -P data/
mlflow ui --backend-store-uri sqlite:///mlflow.db  --default-artifact-root artifacts
python preprocess_data.py --raw_data_path data --dest_path ./output
python train.py
python hpo.py
python register_model.py