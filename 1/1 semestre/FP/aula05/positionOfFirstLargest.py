def positionOfFirstLargest(arr):
   max = arr[0]
   position = 0
   for i in range(len(arr)):
      if arr[i] > max:
         max = arr[i]
         position = i
   return position 