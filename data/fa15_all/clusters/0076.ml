IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))
if x <= 0
then []
else cloneHelper x (n - 1)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
if n <= 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
if n < 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
if n < 10
then [n]
else digitsOfInt (n / 10)
