LamG (IteG EmptyG EmptyG EmptyG)
fun n ->
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))))
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
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
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
fun n ->
  if n < 10
  then 1
  else 1 + additivePersistence (sumList (digitsOfInt n))
fun n ->
  if n = 0 then [0] else help n
fun v ->
  if v = 0
  then acc
  else helper ((v mod 10) :: acc)
              (v / 10)
