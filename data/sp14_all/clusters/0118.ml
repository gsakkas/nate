IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
if n > 10
then digitsOfInt (n mod 10)
else (let a = n mod 10 in
      let b = n / 10 in
      if b = 0 then [n] else [a])
