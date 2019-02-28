
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) = ((((c + x1) + x2) / 10), (((c + x1) + x2) mod 10)) in
    let base = (0, 1) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) =
      ((((c + x1) + x2) / 10), ((((c + x1) + x2) mod 10) :: ds)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,52)-(15,76)
(((c + x1) + x2) mod 10) :: ds
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG])))

(16,19)-(16,20)
[]
ListG EmptyG

*)

(* changed exprs
ConApp (Just (16,31)-(16,63)) "::" (Just (Tuple (Just (16,32)-(16,62)) [Bop (Just (16,32)-(16,56)) Mod (Bop (Just (16,33)-(16,48)) Plus (Bop (Just (16,34)-(16,42)) Plus (Var (Just (16,35)-(16,36)) "c") (Var (Just (16,39)-(16,41)) "x1")) (Var (Just (16,45)-(16,47)) "x2")) (Lit (Just (16,53)-(16,55)) (LI 10)),Var (Just (16,60)-(16,62)) "ds"])) Nothing
List (Just (17,19)-(17,21)) [] Nothing
*)

(* typed spans
(16,31)-(16,63)
(17,19)-(17,21)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
