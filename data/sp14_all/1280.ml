
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | hd::tl -> hd :: (digitsOfInt tl));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,74)
match n with
| n -> [] @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (3,25)-(3,62)) (Var (Just (3,32)-(3,33)) "n") [(VarPat (Just (3,41)-(3,42)) "n",Nothing,App (Just (3,46)-(3,61)) (Var (Just (3,49)-(3,50)) "@") [List (Just (3,46)-(3,48)) [] Nothing,List (Just (3,51)-(3,61)) [Bop (Just (3,52)-(3,60)) Mod (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,58)-(3,60)) (LI 10))] Nothing])]
*)

(* typed spans
(3,25)-(3,62)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
