-- | Combinators for working with boolean predicates.
module Data.Function.Predicate (
    -- * Basic Combinators
    is,
    isn't,

    -- * Lifted Combinators
    (<&&>),
    (<||>),
    liftP2
) where

import Control.Applicative (liftA2)

-- Fixity declarations for the definitions below. Allows for combining predicates as you would
-- booleans, without too many parentheses.
infixr 9 `is`
infixr 9 `isn't`
infixr 3 <&&>
infixr 2 <||>

-- | Allows for writing predicates over projection functions rather than the results of those
-- projections.
is :: (a -> b) -> (b -> Bool) -> a -> Bool
is = flip (.)

-- | The negation of @is@, for convenience.
isn't :: (a -> b) -> (b -> Bool) -> a -> Bool
isn't = ((.) . (.) . (.)) not is

-- | Lifts a binary function from the result level to the predicate level.
liftP2 :: (Bool -> Bool -> Bool) -> (a -> Bool) -> (a -> Bool) -> a -> Bool
liftP2 = liftA2

-- | Lifted conjunction.
(<&&>) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
(<&&>) = liftP2 (&&)

-- | Lifted disjunction.
(<||>) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
(<||>) = liftP2 (||)
