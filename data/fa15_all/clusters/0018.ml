BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))
eval (e1 , x , y) *. eval (e2 , x , y)
eval (r , x , y) /. eval (s , x , y)
sin (pi *. eval (r , x , y)) *. tan (pi *. eval (s , x , y))
eval (a , x , y) *. eval (b , x , y)
eval (e1 , x , y) +. eval (e2 , x , y)
List.length l1 - List.length l2
List.length l2 - List.length l1
eval (t1 , x , y) *. eval (t2 , x , y)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
eval (a , x , y) +. eval (b , x , y)
(eval (a , x , y) ** 2.0) +. (eval (b , x , y) ** 2.0)
eval (m , x , y) *. eval (n , x , y)
List.length l1 = List.length l2
eval (v , x , y) /. eval (w , x , y)
getHead x = getHead (listReverse x)
eval (e , x , y) *. eval (f , x , y)
eval (x5 , x , y) *. eval (x6 , x , y)
eval (expr1 , x , y) *. eval (expr2 , x , y)
eval (expr1 , x , y) +. eval (expr2 , x , y)
