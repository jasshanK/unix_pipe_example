import time

pipe = "named_pipe"

i = 0
while(True):
    with open(pipe, 'w') as file_handle:
        file_handle.write(f"PING {i}")

    i += 1
    time.sleep(1)

