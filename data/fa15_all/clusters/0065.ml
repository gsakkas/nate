IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))
if f b = b
then (b , true)
else (f b , false)
if y = x
then (y , false)
else (y , true)
if List.length l1 < List.length l2
then (clone 0
            (List.length l2 - List.length l1) @ l1 , l2)
else (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
if ((x1 + x2) + h) < 10
then (0 , [0] @ ([(x1 + x2) + h] @ t))
else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
