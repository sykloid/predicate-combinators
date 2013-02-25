-- | Combinators for working with boolean predicates.
module Data.Function.Predicate (
    -- * Basic Combinators
    is,
    isn't,
) where

-- | Allows for writing predicates over projection functions rather than the results of those
-- projections.
is :: (a -> b) -> (b -> Bool) -> a -> Bool
is = flip (.)

-- | The negation of @is@, for convenience.
isn't :: (a -> b) -> (b -> Bool) -> a -> Bool
isn't = ((.) . (.) . (.)) not is
