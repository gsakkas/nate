CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
