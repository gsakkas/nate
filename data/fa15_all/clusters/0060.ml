LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))
let digits = digitsOfInt n in
sumList digits
let (l1' , l2') =
  padZero l1 l2 in
List.combine l1' l2'
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
let (x , res) =
  List.fold_left f base args in
res @ helper (List.length l2 * 2)
             x
let n = digitsOfInt n in
sumList n
let rest' = filter t h in
helper (seen' , rest')
let l' = bigAdd l l in
mulByDigit (i - 1) l'
