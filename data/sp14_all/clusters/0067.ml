IteG (BopG EmptyG EmptyG) (ListG [EmptyG]) (AppG [EmptyG,EmptyG])
if n > 0
then x :: (clone x (n - 1))
else []
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
