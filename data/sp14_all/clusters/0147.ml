CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])
match i with
| 0 -> [0]
| 1 -> l
| _ -> helper (i - 1) l
              (bigAdd acc l)
match i with
| 0 -> [0]
| 1 -> l
| _ -> helper (i - 1) l
              (bigAdd acc l)
match i with
| 0 -> [0]
| 1 -> l
| _ -> helper (i - 1) l
              (bigAdd acc l)
