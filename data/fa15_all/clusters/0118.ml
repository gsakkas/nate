BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)
eval (a , x , y) +. (eval (b , x , y) /. 2.0)
eval (m4 , x , y) *. (1.0 +. sqrt 5.0)
eval (e1 , x , y) /. (eval (e1 , x , y) *. eval (e1 , x , y))
