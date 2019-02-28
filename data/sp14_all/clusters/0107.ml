IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))
if b = ans
then (ans , false)
else (ans , true)
if length1 < length2
then (List.append (clone 0
                         (length2 - length1)) l1 , l2)
else (l1 , List.append (clone 0
                              (length1 - length2)) l2)
if List.length l1 < List.length l2
then (List.append (clone 0
                         (List.length l2 - List.length l1))
                  l1 , l2)
else (l1 , List.append (clone 0
                              (List.length l1 - List.length l2))
                       l2)
