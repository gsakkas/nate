
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,38)-(3,54)
hd
VarG

*)

(* changed exprs
Var (Just (3,38)-(3,40)) "hd"
*)

(* typed spans
(3,38)-(3,40)
*)

(* correct types
'a
*)

(* bad types
'a
*)
