
let carry x y = (x * y) / 10;;

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t -> [(mulByDigit i t) + (carry h i)] @ [remainder i t]);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [remainder i h]
          | h'::t' -> [h' * i] @ (mulByDigit i t')));;

*)

(* changed spans
(4,14)-(4,62)
if (x * y) > 10
then (x * y) mod 10
else 0
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) LitG

(12,15)-(12,65)
match t with
| [] -> [remainder i h]
| h' :: t' -> [h' * i] @ mulByDigit i
                                    t'
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Ite (Just (2,20)-(2,62)) (Bop (Just (2,23)-(2,35)) Gt (Bop (Just (2,23)-(2,30)) Times (Var (Just (2,24)-(2,25)) "x") (Var (Just (2,28)-(2,29)) "y")) (Lit (Just (2,33)-(2,35)) (LI 10))) (Bop (Just (2,41)-(2,55)) Mod (Bop (Just (2,41)-(2,48)) Times (Var (Just (2,42)-(2,43)) "x") (Var (Just (2,46)-(2,47)) "y")) (Lit (Just (2,53)-(2,55)) (LI 10))) (Lit (Just (2,61)-(2,62)) (LI 0))
Case (Just (11,9)-(13,51)) (Var (Just (11,16)-(11,17)) "t") [(ConPat (Just (12,12)-(12,14)) "[]" Nothing,Nothing,List (Just (12,18)-(12,33)) [App (Just (12,19)-(12,32)) (Var (Just (12,19)-(12,28)) "remainder") [Var (Just (12,29)-(12,30)) "i",Var (Just (12,31)-(12,32)) "h"]] Nothing),(ConsPat (Just (13,12)-(13,18)) (VarPat (Just (13,12)-(13,14)) "h'") (VarPat (Just (13,16)-(13,18)) "t'"),Nothing,App (Just (13,22)-(13,50)) (Var (Just (13,31)-(13,32)) "@") [List (Just (13,22)-(13,30)) [Bop (Just (13,23)-(13,29)) Times (Var (Just (13,23)-(13,25)) "h'") (Var (Just (13,28)-(13,29)) "i")] Nothing,App (Just (13,33)-(13,50)) (Var (Just (13,34)-(13,44)) "mulByDigit") [Var (Just (13,45)-(13,46)) "i",Var (Just (13,47)-(13,49)) "t'"]])]
*)

(* typed spans
(2,20)-(2,62)
(11,9)-(13,51)
*)

(* correct types
int
int list
*)

(* bad types
int -> int -> int
int list
*)
