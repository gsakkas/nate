IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))
if n < 10
then n
else addList (digitsOfInt n)
if a = 0
then b
else integers (a / 10)
              ((a mod 10) :: b)
if x < 10
then count
else helper (count + 1)
            (sumList (digits n))
if v = 0
then acc
else helper ((v mod 10) :: acc)
            (v / 10)
