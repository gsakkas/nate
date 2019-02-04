
let pipe fs =
  let f a x = match x with | [] -> a | _ -> x a in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,42)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,14)-(3,47)
EMPTY
EmptyG

(3,20)-(3,21)
EMPTY
EmptyG

(3,35)-(3,36)
EMPTY
EmptyG

(4,13)-(4,14)
n
VarG

*)
