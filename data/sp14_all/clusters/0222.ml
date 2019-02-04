CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
