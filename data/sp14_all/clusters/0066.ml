LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))
let rec listReverseHelper =
  fun l ->
    fun ans ->
      match ans with
      | [] -> []
      | h :: t -> listReverseHelper t
                                    (h :: ans) in
listReverseHelper l []
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
let rec helper =
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
