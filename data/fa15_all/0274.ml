
let rec mulByDigit i l =
  let f a x =
    let c = i * x in match a with | [] -> [] | h::t -> (h * i) mod 10 in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let c = i * x in match a with | [] -> [] | h::t -> ((h * i) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(4,55)-(4,69)
((h * i) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG])))

*)

(* changed exprs
ConApp (Just (4,55)-(4,76)) "::" (Just (Tuple (Just (4,55)-(4,76)) [Bop (Just (4,55)-(4,71)) Mod (Bop (Just (4,56)-(4,63)) Times (Var (Just (4,57)-(4,58)) "h") (Var (Just (4,61)-(4,62)) "i")) (Lit (Just (4,68)-(4,70)) (LI 10)),Var (Just (4,75)-(4,76)) "t"])) Nothing
*)

(* typed spans
(4,55)-(4,76)
*)

(* correct types
int list
*)

(* bad types
int
*)
