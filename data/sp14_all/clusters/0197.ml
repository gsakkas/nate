LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)
let explosion = explode w in
if explosion = listReverse explosion
then true
else false
