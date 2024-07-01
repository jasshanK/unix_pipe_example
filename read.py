pipe = "named_pipe"

while(True):
    with open(pipe, 'r') as file_handle:
        line = file_handle.readline()
        print(line)
