LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun l ->
  match l with
  | [] -> []
  | x :: xs' -> listReverse xs' @ [x]
fun (x , y) ->
  match y with
  | [] -> x
  | h :: t -> (let z = h :: x in
               append (z , t))
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun (f , b) ->
  match f b with
  | (b' , c') -> if c'
                 then wwhile (f , b')
                 else b'
fun x ->
  match explode x with
  | h :: t -> false
fun z ->
  match listReverse z with
  | [] -> []
  | h :: t -> t
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
fun w ->
  match w with
  | [] -> true
  | h :: t -> if h = List.hd (listReverse w)
              then true
              else false
fun n ->
  match n with
  | 0 -> []
  | 1 -> [0]
  | x -> [0] @ listZeros (n - 1)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
