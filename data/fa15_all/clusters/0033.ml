LamG (IteG EmptyG EmptyG EmptyG)
fun b ->
  if f b
  then (b , true)
  else (b , false)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
fun x ->
  if f x = b
  then (b , true)
  else (f x , false)
fun n ->
  if n < 10
  then 0
  else (let x = myHelper n in
        1 + additivePersistence x)
fun n ->
  if n < 10 then n else helper n
fun n ->
  if n <= 0
  then []
  else x :: (clone x (n - 1))
fun (num , numList) ->
  if num < 10
  then num :: numList
  else digitsOfIntHelper (num / 10 , (num mod 10) :: numList)
fun n ->
  if n < 10
  then [n]
  else digitsOfIntHelper (n , [])
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
