LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let test =
  match a1 with
  | [] -> 0
  | h :: t -> h in
let sum =
  (l1x + l2x) + test in
((sum / 10) :: a1 , (sum mod 10) :: a2)
let test =
  match a1 with
  | [] -> 0
  | h :: t -> h in
let sum =
  (l1x + l2x) + test in
((sum / 10) :: a1 , (sum mod 10) :: a2)
