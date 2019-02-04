IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ConAppG (Just EmptyG) Nothing)
if n <= 0
then []
else (n mod 10) :: (digitsOfInt (n / 10))
if n <= 0
then []
else (n mod 10) :: (digitsOfInt (n / 10))
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
if tl = []
then [(hd , x)]
else (hd , x) :: (argmaker x
                           tl)
if n < 1
then []
else x :: (clone x (n - 1))
