LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))
let digits = digitsOfInt n in
sumList digits
let d =
  digitsOfInt (n / 10) in
(n mod 10) :: d
let l' = bigAdd l l in
mulByDigit (i - 1) l'
