
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 -> let rec helper acc v = v = 0 in helper [] h1);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 ->
           let rec helper acc v = if v = 0 then [1] else [0] in helper [] h1);;

*)

(* changed spans
(10,42)-(10,47)
if v = 0 then [1] else [0]
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (ListG EmptyG)

*)

(* changed exprs
Ite (Just (11,34)-(11,60)) (Bop (Just (11,37)-(11,42)) Eq (Var (Just (11,37)-(11,38)) "v") (Lit (Just (11,41)-(11,42)) (LI 0))) (List (Just (11,48)-(11,51)) [Lit (Just (11,49)-(11,50)) (LI 1)] Nothing) (List (Just (11,57)-(11,60)) [Lit (Just (11,58)-(11,59)) (LI 0)] Nothing)
*)

(* typed spans
(11,34)-(11,60)
*)

(* correct types
int list
*)

(* bad types
bool
*)
