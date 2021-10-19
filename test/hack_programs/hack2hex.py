import sys

# def bitstring_to_bytes(s):
#     v = int(s, 2)
#     b = bytearray()
#     while v:
#         b.append(v & 0xff)
#         v >>= 8
#     return bytes(b[::-1])

def binword_to_bytes(s):
    v = int(s, 2)
    b = bytearray()
    b.append(v & 0xff)
    v >>= 8
    b.append(v & 0xff)
    v >>= 8
    return bytes(b[::-1])
    

    
print ('Number of arguments:', len(sys.argv), 'arguments.')
print ('Argument List:', str(sys.argv))

inputf = open(sys.argv[1], "r")
# outputf = open("_output_.hex", "wb")
outputf = open(sys.argv[2], "xb")

for line in inputf:
    print(line)
#    number = bytes( int(line,2) >>8)
    outputf.write(binword_to_bytes(line))

inputf.close()
outputf.close()
