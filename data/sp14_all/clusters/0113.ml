CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG)]
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
