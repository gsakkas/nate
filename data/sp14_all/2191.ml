
let rec wwhile (f,b) =
  let check = f b in
  match (f, b) with | (x,y) -> if y = false then x else wwhile (f, x);;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,8)-(4,14)
check
VarG

*)

(* changed exprs
Var (Just (4,8)-(4,13)) "check"
*)

(* typed spans
(4,8)-(4,13)
*)

(* correct types
('a * bool)
*)

(* bad types
(bool -> 'a * bool)
*)
