#MULTIPLY BY SUMS
def mul (a:int,b:int)->int:
    temp=0
    if a > b: #Select smaller instructions's quantity
        for i in range(1,b):
            #Consecutives sums to emu a multiply
            temp += a
        return a+temp

    else:
        for i in range(1, a):
            temp += b
        return b+temp

#BUBBLE SORT
def bubble_sort(arr:list)->None:
    n = len(arr)

    # Traverse through all array elements
    for i in range(n):
        # Last i elements are already in place, so we don't need to check them
        for j in range(0, n-i-1):
            # Swap if the element found is greater than the next element
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

#MERGE SORT
def merge_sort(arr:list) ->None:
    if len(arr) > 1:
        mid = len(arr) // 2  # Find the middle of the array
        left_half = arr[:mid]  # Divide the array into two halves
        right_half = arr[mid:]

        merge_sort(left_half)  # Recursive call on the left half
        merge_sort(right_half)  # Recursive call on the right half

        # Merge the two halves
        i, j, k = 0, 0, 0  # i for left_half, j for right_half, k for merged array
        while i < len(left_half) and j < len(right_half):
            if left_half[i] < right_half[j]:
                arr[k] = left_half[i]
                i += 1
            else:
                arr[k] = right_half[j]
                j += 1
            k += 1

        # Check if any elements are left
        while i < len(left_half):
            arr[k] = left_half[i]
            i += 1
            k += 1

        while j < len(right_half):
            arr[k] = right_half[j]
            j += 1
            k += 1


def main():
    v = [1,4,2,78,-1,0,2,33,24,0,-2]
#    bubble_sort(v)
    merge_sort(v)
    print(v)
    print(mul(7, 5))

if __name__ == '__main__':
    main()
