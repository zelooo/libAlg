{-
    Edx course Part 1 Assignment
-}

{- Assignment 1 -}
-- String to Kmers
string_to_kmers :: Int -> String -> [String]
string_to_kmers _ [] = []
string_to_kmers n str
    | length str < n = []
    | otherwise = [ take n str ] ++ string_to_kmers n (tail str)

{- Assignment 2 -}
-- Reconstructing the Genome from kmers
genome_reconstruction :: [String] -> String
genome_reconstruction (s:ss) = s ++ concat [ diff' x y  | (x, y) <- zip (s:ss) ss ]

-- Compare difference of the latter one
diff' :: String -> String -> String
diff' [] [] = []
diff' [] ys = ys
diff' (x:xs) (y:ys)
    | x == y = diff' xs ys
    | otherwise = diff' xs (y:ys)

{- Assignment 3 -}
-- Construct the Overlap Graph of Collection of k-mers

{-
    - Sample adjacency List representation
    - Not edges involved
    - Graph is (node, (set of connected nodes))
-}

type Vertax' a = a
type Graph' a = [ ( Vertax' a, [ Vertax' a ] ) ] -- pure adjacency list

construct_overlap_graph :: [String] -> Graph' String
construct_overlap_graph [] = []
construct_overlap_graph str = [ ( v, connect_component v str ) | v <- str ]
    -- connect_component :: Node' a -> [ Node' a]
    where first_k a =  take (length a - 1) a -- k - 1 first
          last_k a = drop 1 a   -- k - 1 last
          connect_component vertax strings  = [ s | s <- strings ,last_k vertax == first_k s ]

elimenate_duplicates :: [String] -> [String]
elimenate_duplicates [] = []
elimenate_duplicates (x:xs)
    | x `elem` xs = elimenate_duplicates xs
    | otherwise = x : elimenate_duplicates xs

-- Final function
make_graph = construct_overlap_graph . elimenate_duplicates

{- Assignment 4 -}
-- DebruijinGraph
type Edge' a = a
-- This adjacency list included the edge
-- likt for a Vertax i, it is connect with vertax j with edge k
type Graph'' a = [ ( Vertax' a, [ ( Vertax' a,  Edge' a ) ] ) ]
{- can also be the one at below
since there can be more than one edge connect to the same Vertiax -}
type Graph''' a = [ ( Vertax' a, [ ( Vertax' a,  [ Edge' a ] ) ] ) ]
