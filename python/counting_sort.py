# Counting sort in Python programming

def countingSort(array):
    print("array to sort, ", array)
    maxi =  max(array)+1
    size = len(array)
    output = [0] * size
    count = [0] * maxi

    for i in range(size):
        count[array[i]] += 1

    for i in range(1,maxi):
        count[i] += count[i-1]
    print(count) 

    
    for i in range(size):
        output[count[array[i]]-1] = array[i]
        count[array[i]] -= 1
    print(output)


def countingSort2(array):
    print("array to sort, ", array)
    size = len(array)
    output = [0] * size

    # Initialize count array
    count = [0] * 10

    # Store the count of each elements in count array
    for i in range(0, size):
        count[array[i]] += 1
    print("count pre", count)

    # Store the cummulative count
    for i in range(1, 10):
        count[i] += count[i - 1]
    print("count cummulative", count)
    print("\n")


    # Find the index of each element of the original array in count array
    # place the elements in output array
    i = size - 1
    while i >= 0:
        output[count[array[i]] - 1] = array[i]
        count[array[i]] -= 1
        i -= 1
        print("output ", output)
        print("count cummulative", count)
        print("\n")

    # Copy the sorted elements into original array
    for i in range(0, size):
        array[i] = output[i]

d = [4, 2, 2, 8, 3, 0,0,0,3, 1]
for i in enumerate(d):
    print(i) 

# data = [4, 2, 2, 8, 3, 3, 1]
# countingSort(data)
# print("Sorted Array in Ascending Order: ")
# print(data)