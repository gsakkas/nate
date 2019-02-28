LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
let depth = depth - 1 in
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth))
| 1 -> buildCosine (build (rand , depth))
| 2 -> buildAverage (build (rand , depth) , build (rand , depth))
| 3 -> buildTimes (build (rand , depth) , build (rand , depth))
| 4 -> buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
