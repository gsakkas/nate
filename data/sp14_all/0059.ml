
let pipe fs =
  let f a x = x a in
  let base = match fs with | (fn,n) -> n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let piper fn n =
    let f a x = x a in let base = n in List.fold_left f base fs in
  piper fs;;

*)

(* changed spans
(3,2)-(4,68)
let piper =
  fun fn ->
    fun n ->
      (let f =
         fun a -> fun x -> x a in
       let base = n in
       List.fold_left f base fs) in
piper fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,13)-(4,40)
EMPTY
EmptyG

(4,19)-(4,21)
EMPTY
EmptyG

*)
