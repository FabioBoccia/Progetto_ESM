ECHO OFF
ECHO Questo file deve essere avviato dal prompt di Anaconda!
PAUSE
git clone https://github.com/CompVis/taming-transformers
cd taming-transformers
mkdir logs
ECHO
ECHO Scarica https://app.koofr.net/links/0fc005bf-3dca-4079-9d40-cdf38d42cd7a e estrai il contenuto nella directory aperta (%cd%\logs)
explorer %cd%\logs
PAUSE
call conda env create -f environment.yaml
call activate taming
python scripts\sample_fast.py -r logs\2021-04-23T18-19-01_ffhq_transformer\ -n 3000
call conda deactivate
conda env remove -n taming