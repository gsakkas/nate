CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])
match l with
| [] -> []
| hd :: tl -> mulByDigit i
                         tl @ [hd * i]
match l with
| [] -> []
| head :: [] -> [head]
| head :: tail -> listReverse tail @ [head]
match l with
| [] -> []
| h :: tail -> listReverse tail @ [h]
match t with
| [] -> [remainder i h]
| h' :: t' -> [h' * i] @ mulByDigit i
                                    t'
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
