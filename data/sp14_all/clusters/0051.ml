LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
function | y -> y
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
function | g -> g
function | x -> x
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
