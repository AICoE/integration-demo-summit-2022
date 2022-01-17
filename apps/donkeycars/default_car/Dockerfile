FROM docker.io/haoru233/tritonai-donkeycar:4.1-cpu
ADD models/mypilot.h5 /donkeys/mycar/models/mypilot.h5
ADD myconfig.py /donkeys/mycar/myconfig.py
EXPOSE 8887
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "donkey", "python", "manage.py", "drive"]
