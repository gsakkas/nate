CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))))])
match n with
| n_ -> (n_ mod 10) :: (digitsOfInt n_)
