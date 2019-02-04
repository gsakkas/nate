IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (IteG EmptyG EmptyG EmptyG)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else if List.length l1 < List.length l2
     then (clone 0
                 (List.length l2 - List.length l1) @ l1 , l2)
     else (l1 , l2)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else if List.length l1 < List.length l2
     then (clone 0
                 (List.length l2 - List.length l1) @ l1 , l2)
     else (l1 , l2)
