CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
