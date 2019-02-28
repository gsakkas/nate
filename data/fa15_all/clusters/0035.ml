LamG (LetG NonRec (fromList [EmptyG]) EmptyG)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun b ->
  (let f =
     fun a -> fun x -> x a in
   let base = b in
   List.fold_left f base fs)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
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
  (let (x , y) = f b in
   match y with
   | false -> x
   | true -> wwhile (f , x))
fun x ->
  (let (b , c) = a in
   let r =
     bigAdd (mulByDigit x
                        (List.rev l2)) [b] in
   match r with
   | [] -> (0 , 0 :: c)
   | h :: t -> (h , (List.hd t) :: c))
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun x ->
  (let b' = f b in
   (b' , b' = b))
fun func ->
  (let result = f b in
   (result , result = b))
fun b' ->
  (let result = f b' in
   (result , result = b'))
fun x ->
  (let (x1 , x2) = x in
   let (a1 , a2) = a in
   ((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2))
fun b ->
  (let fb = f b in
   if fb = b
   then (true , fb)
   else (false , fb))
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
