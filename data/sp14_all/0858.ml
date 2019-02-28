
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | h::t -> listReverse ns
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | _ -> listReverse ns
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(7,2)-(10,67)
match n with
| _ -> listReverse ns
| 0 -> ns
| n -> if n < 0
       then []
       else (n mod 10) :: (digitsOfInt (n / 10))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (7,2)-(10,67)) (Var (Just (7,8)-(7,9)) "n") [(WildPat (Just (8,4)-(8,5)),Nothing,App (Just (8,9)-(8,23)) (Var (Just (8,9)-(8,20)) "listReverse") [Var (Just (8,21)-(8,23)) "ns"]),(LitPat (Just (9,4)-(9,5)) (LI 0),Nothing,Var (Just (9,9)-(9,11)) "ns"),(VarPat (Just (10,4)-(10,5)) "n",Nothing,Ite (Just (10,9)-(10,67)) (Bop (Just (10,12)-(10,17)) Lt (Var (Just (10,12)-(10,13)) "n") (Lit (Just (10,16)-(10,17)) (LI 0))) (List (Just (10,23)-(10,25)) [] Nothing) (ConApp (Just (10,31)-(10,67)) "::" (Just (Tuple (Just (10,31)-(10,67)) [Bop (Just (10,31)-(10,41)) Mod (Var (Just (10,32)-(10,33)) "n") (Lit (Just (10,38)-(10,40)) (LI 10)),App (Just (10,45)-(10,67)) (Var (Just (10,46)-(10,57)) "digitsOfInt") [Bop (Just (10,58)-(10,66)) Div (Var (Just (10,59)-(10,60)) "n") (Lit (Just (10,63)-(10,65)) (LI 10))]])) Nothing))]
*)

(* typed spans
(7,2)-(10,67)
*)

(* correct types
int list
*)

(* bad types
int list
*)
