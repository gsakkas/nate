CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG])))]))))])
match a with
| hd :: tl -> (((fst x + snd x) + hd) / 10) :: ((((fst x + snd x) + hd) mod 10) :: tl)
