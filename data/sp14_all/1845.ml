
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs2 with | [] -> xs1 | hd::tl -> append (xs1 :: hd) tl in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(4,43)-(4,64)
xs2
VarG

(4,58)-(4,60)
append tl xs2
AppG (fromList [VarG])

(4,62)-(4,64)
xs2
VarG

*)

(* changed exprs
Var (Just (4,27)-(4,30)) "xs2"
App (Just (4,49)-(4,64)) (Var (Just (4,50)-(4,56)) "append") [Var (Just (4,57)-(4,59)) "tl",Var (Just (4,60)-(4,63)) "xs2"]
Var (Just (4,60)-(4,63)) "xs2"
*)

(* typed spans
(4,27)-(4,30)
(4,49)-(4,64)
(4,60)-(4,63)
*)

(* correct types
int list
int list
int list
*)

(* bad types
'a
'a list
'a list list
*)
