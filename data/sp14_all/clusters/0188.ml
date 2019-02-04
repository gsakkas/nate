LamG (LetG Rec (fromList [EmptyG]) EmptyG)
fun n ->
  (let rec digitsHelper =
     fun n ->
       fun l ->
         if n = 0
         then l
         else digitsHelper (n / 10)
                           ((n mod 10) :: l) in
   if n <= 0
   then []
   else digitsHelper n [])
