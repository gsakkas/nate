LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let f =
  fun a ->
    fun x ->
      (let (b , c) = a in
       match b with
       | d :: t -> ((d * 10) :: t , t)
       | _ -> a) in
let base = (1 :: l2 , [0]) in
let args = List.rev l1 in
let (_ , res) =
  List.fold_left f base args in
res
let f =
  fun a ->
    fun x -> fun p -> x (a p) in
let base = fun b -> b in
List.fold_left f base fs
