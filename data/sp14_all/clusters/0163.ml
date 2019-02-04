BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)
eval (e1 , x , y) +. (eval (e2 , x , y) /. 2.0)
eval (f , x , y) +. (eval (g , x , y) *. eval (h , x , y))
