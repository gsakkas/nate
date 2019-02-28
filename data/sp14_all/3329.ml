
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> [helper t1; h1 mod 10] in
           helper [h]);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> (helper t1) @ [h1 mod 10] in
           helper [h]);;

*)

(* changed spans
(12,51)-(12,73)
helper t1 @ [h1 mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (12,51)-(12,76)) (Var (Just (12,63)-(12,64)) "@") [App (Just (12,51)-(12,62)) (Var (Just (12,52)-(12,58)) "helper") [Var (Just (12,59)-(12,61)) "t1"],List (Just (12,65)-(12,76)) [Bop (Just (12,66)-(12,75)) Mod (Var (Just (12,66)-(12,68)) "h1") (Lit (Just (12,73)-(12,75)) (LI 10))] Nothing]
*)

(* typed spans
(12,51)-(12,76)
*)

(* correct types
int list
*)

(* bad types
int list
*)
