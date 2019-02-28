LamG (AppG (fromList [EmptyG]))
fun n -> digitsOfInt (abs n)
fun p_pre -> x (a p_pre)
fun n -> x n
fun (f , b) ->
  wwhile (fun x ->
            (b , f b = b) , b)
fun n -> x (a n)
fun a -> x a
fun g -> x (a g)
fun d -> x (a d)
fun y -> x (a y)
fun q -> x q
fun x -> a x
fun l ->
  int_of_string (sepConcat ""
                           (List.map string_of_int l))
fun x' -> x (a x')
fun b -> x (a b)
fun z -> x (a z)
fun b -> x b
fun c -> x (a c)
fun l ->
  List.map string_of_int
fun g -> f a x
