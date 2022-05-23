def printingValues(object,key):
    temp_string = ""
    for i in range(len(key)):
        if i % 2 == 0:
            temp_string = temp_string + key[i]
    num = temp_string
    return object[num[0]][num[1]][num[2]]

object = {"x":{"y":{"z":"a"}}}
key = 'x/y/z'
value = printingValues(object,key)
print("value = ", value)
