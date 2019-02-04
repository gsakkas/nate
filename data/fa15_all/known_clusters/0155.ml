CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing]))) Nothing)])
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
