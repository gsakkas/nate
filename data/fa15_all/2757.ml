
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> [remainder h i] @ ([(i * h) / 10] + (mulByDigit i t)));;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> (remainder h i) :: (mulByDigit i t));;

*)

(* changed spans
(10,14)-(10,67)
(remainder h
           i) :: (mulByDigit i t)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG])])))

*)

(* changed exprs
ConApp (Just (10,14)-(10,49)) "::" (Just (Tuple (Just (10,14)-(10,49)) [App (Just (10,14)-(10,29)) (Var (Just (10,15)-(10,24)) "remainder") [Var (Just (10,25)-(10,26)) "h",Var (Just (10,27)-(10,28)) "i"],App (Just (10,33)-(10,49)) (Var (Just (10,34)-(10,44)) "mulByDigit") [Var (Just (10,45)-(10,46)) "i",Var (Just (10,47)-(10,48)) "t"]])) Nothing
*)

(* typed spans
(10,14)-(10,49)
*)

(* correct types
int list
*)

(* bad types
int list
*)
