LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
let (b' , c') = f b in
match c' with
| false -> b'
