LamG (LetG NonRec (fromList [EmptyG]) EmptyG)
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun b ->
  (let f =
     fun a -> fun x -> x a in
   let base = b in
   List.fold_left f base fs)
fun (l1 , l2) ->
  (let f =
     fun a ->
       fun x ->
         (let (carry , acc) = a in
          let (x1 , x2) = x in
          let sum = (x1 + x2) + carry in
          (sum / 10 , (sum mod 10) :: acc)) in
   let base = (0 , []) in
   let args =
     List.combine l1 l2 in
   let (_ , res) =
     List.fold_left f base args in
   res)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
fun l ->
  (let f =
     fun a ->
       fun x ->
         if List.length a = 0
         then if x = 0 then [] else [x]
         else a @ [x] in
   let base = [] in
   List.fold_left f base l)
fun l ->
  (let f =
     fun a ->
       fun x ->
         if List.length a = 0
         then if x = 0 then [] else [x]
         else a @ [x] in
   let base = [] in
   List.fold_left f base l)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun (f , b) ->
  (let (x , y) = f b in
   match y with
   | false -> x
   | true -> wwhile (f , x))
fun (f , b) ->
  (let (x , y) = f b in
   match y with
   | false -> x
   | true -> wwhile (f , x))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun l2 ->
  (let f =
     fun a ->
       fun x ->
         (let (b , c) = a in
          let r =
            bigAdd (mulByDigit x
                               (List.rev l2)) [b] in
          match r with
          | [] -> (0 , 0 :: c)
          | h :: t -> (h , (List.hd t) :: c)) in
   let base = (0 , []) in
   let args = List.rev l1 in
   let (_ , res) =
     List.fold_left f base args in
   res)
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
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun x ->
  (let b' = f b in
   (b' , b' = b))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
fun func ->
  (let result = f b in
   (result , result = b))
fun b' ->
  (let result = f b' in
   (result , result = b'))
fun l2 ->
  (let add =
     fun (l1 , l2) ->
       (let f =
          fun a ->
            fun x ->
              match a with
              | (o , l) -> (let sum =
                              x + o in
                            if sum < 10
                            then (0 , sum :: l)
                            else (1 , (sum - 10) :: l)) in
        let base = (0 , []) in
        let args =
          (let combine =
             fun (a , b) -> a + b in
           List.map combine
                    (List.rev (List.combine l1
                                            l2)) @ [0]) in
        let (_ , res) =
          List.fold_left f base args in
        res) in
   removeZero (add (padZero l1
                            l2)))
fun x ->
  (let calcfx = f x in
   (calcfx , calcfx = x))
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
