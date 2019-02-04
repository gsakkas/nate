LamG (LetG NonRec (fromList [EmptyG]) EmptyG)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = fun n -> 0 in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
fun a ->
  (let (carry , num) = a in
   let (l1' , l2') = x in
   let addit =
     (l1' + l2') + carry in
   (if addit > 10
    then 1
    else 0 , (addit mod 10) :: num))
fun x ->
  (let xx = f b in
   (xx , xx = b))
fun x ->
  (let xx = f b in
   (xx , xx = b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let bb = f b in
   (bb , bb = b))
fun x ->
  (let bb = f x in
   (bb , bb = x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> x))
fun x ->
  (let xi = f x in
   (xi , (f xi <> xi) || f (f xi)))
fun (l1 , l2) ->
  (let f =
     fun a ->
       fun x ->
         (let z = fst x + snd x in
          match a with
          | (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)) in
   let base = (0 , []) in
   let args =
     List.rev (List.combine l1
                            l2) in
   let (_ , res) =
     List.fold_left f base args in
   res)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun num ->
  (let f =
     fun a -> fun x -> x a in
   let base = num in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun b ->
  (let b' = f b in
   (b' , f b <> b))
fun x ->
  (let y = f x in (y , y <> x))
fun x ->
  (let y = f x in (y , y <> x))
fun (seed1 , seed2) ->
  (let seed =
     Array.of_list [seed1 ; seed2] in
   let s =
     Random.State.make seed in
   fun (x , y) ->
     x + Random.State.int s
                          (y - x))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
