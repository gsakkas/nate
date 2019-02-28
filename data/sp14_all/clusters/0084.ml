CaseG VarG (fromList [(Nothing,ListG EmptyG)])
match n with
| n -> [n]
match l with
| [] -> []
| b :: [] -> [b]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
match l with
| [] -> []
