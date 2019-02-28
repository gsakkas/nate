LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ListG EmptyG)
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
