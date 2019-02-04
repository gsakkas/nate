LamG (IteG EmptyG EmptyG EmptyG)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if x = f x
  then (x , false)
  else (f x , true)
fun (num , newList) ->
  if num < 10
  then num :: newList
  else helperDigits (num / 10 , (num mod 10) :: newList)
fun (count , n) ->
  if n < 10
  then count + 1
  else addHelp (count + 1 , addNum n)
fun n ->
  if n <= 0
  then []
  else append (digitsOfInt (n / 10))
              [n - ((n / 10) * 10)]
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
fun n ->
  if n = 0
  then [0]
  else getDigits n
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun n ->
  if n < 10
  then 1
  else 1 + additivePersistence (sumList (digitsOfInt n))
