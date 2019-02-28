LamG (AppG (fromList [EmptyG]))
fun fn -> x (fun a -> a)
fun c -> x c
fun x -> h (acc x)
fun a -> x a
fun y -> x (a y)
fun q -> x (a q)
fun (f , b) ->
  wwhile (let func =
            fun b ->
              (let ans = f b in
               if b = ans
               then (ans , false)
               else (ans , true)) in
          func , b)
fun n -> addHelp (0 , n)
fun c -> x (a c)
fun n -> digitsOfInt (abs n)
fun i -> x (a i)
fun l -> x (a l)
fun z -> x (a z)
fun x -> a x
fun z -> a (x z)
fun n -> digOfInt n
fun p -> x (a p)
fun y -> a (x y)
fun y -> x y
fun b -> x (a b)
fun w -> x (a w)
