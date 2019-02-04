CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
