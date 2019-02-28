
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> helper (append [m / 10] [m mod 10]) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(6,34)-(6,69)
append (helper (m / 10))
       [m mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (6,34)-(6,69)) (Var (Just (6,34)-(6,40)) "append") [App (Just (6,41)-(6,58)) (Var (Just (6,42)-(6,48)) "helper") [Bop (Just (6,49)-(6,57)) Div (Var (Just (6,50)-(6,51)) "m") (Lit (Just (6,54)-(6,56)) (LI 10))],List (Just (6,59)-(6,69)) [Bop (Just (6,60)-(6,68)) Mod (Var (Just (6,60)-(6,61)) "m") (Lit (Just (6,66)-(6,68)) (LI 10))] Nothing]
*)

(* typed spans
(6,34)-(6,69)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
