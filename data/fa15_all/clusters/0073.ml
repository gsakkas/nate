LamG (ConAppG (Just (TupleG (fromList [VarG]))))
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
fun (e1 , e2) ->
  Times (e1 , e2)
fun (x , m) -> x :: m
fun (e1 , e2) ->
  Average (e1 , e2)
