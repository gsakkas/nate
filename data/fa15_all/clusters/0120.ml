IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) LitG
if getHead x = getHead (listReverse x)
then matchHeads (getTail (listReverse t))
else false
