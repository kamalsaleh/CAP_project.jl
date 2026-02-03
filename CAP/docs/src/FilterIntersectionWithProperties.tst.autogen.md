# Filter Intersection With Properties

This document demonstrates the `@FilterIntersectionWithProperties` macro and the filter specialization registry system for property-based dispatch in CAP.

## Overview

The `@FilterIntersectionWithProperties` macro allows creating specialized filters that combine a base filter with one or more properties. The system automatically tracks these specializations in a registry, enabling efficient lookup of the most specific filter matching an object.

## Basic Setup

```jldoctest FilterIntersectionWithProperties
julia> using CAP

julia> @DeclareFilter("IsF1", IsCapCategory);

julia> @DeclareFilter("IsF2", IsCapCategory);

julia> @DeclareFilter("IsF3", IsCapCategory);

julia> @DeclareProperty("SatisfiesPropertyP1", IsCapCategory);

julia> @DeclareProperty("SatisfiesPropertyP2", IsCapCategory);

```

## Creating Specialized Filters

Filters can be combined with properties using `@FilterIntersectionWithProperties`:

```jldoctest FilterIntersectionWithProperties
julia> @FilterIntersectionWithProperties(IsF1, SatisfiesPropertyP1);

julia> @FilterIntersectionWithProperties(IsF1, SatisfiesPropertyP1, SatisfiesPropertyP2);

julia> @FilterIntersectionWithProperties(IsF2, SatisfiesPropertyP2);

```

## Registry Verification

The specialization registry tracks all property-based filters:

```jldoctest FilterIntersectionWithProperties
julia> get_filter_specializations(IsF1)
2-element Vector{Filter}:
 <Filter "IsF1_and_SatisfiesPropertyP1">
 <Filter "IsF1_and_SatisfiesPropertyP1_and_SatisfiesPropertyP2">


julia> get_filter_specializations(IsF2)
1-element Vector{Filter}:
 <Filter "IsF2_and_SatisfiesPropertyP2">
```

## Installing Methods with Property-Based Filters

Methods can be installed for specialized filters:

```jldoctest FilterIntersectionWithProperties
julia> @DeclareOperation("TestOp", [IsCapCategory]);

julia> @InstallMethod(TestOp, [IsF1], obj -> "Method for IsF1");

julia> @InstallMethod(TestOp, [FilterIntersectionWithProperties(IsF1, SatisfiesPropertyP1)], obj -> "Method for IsF1 with Property P1");

julia> @InstallMethod(TestOp, [FilterIntersectionWithProperties(IsF1, SatisfiesPropertyP1, SatisfiesPropertyP2)], obj -> "Method for IsF1 with Properties P1 and P2");

julia> @InstallMethod(TestOp, [IsF2], obj -> "Method for IsF2");

julia> @InstallMethod(TestOp, [FilterIntersectionWithProperties(IsF2, SatisfiesPropertyP2)], obj -> "Method for IsF2 with Property P2");
```

## Testing Dispatch

Create test objects and verify method dispatch:

```jldoctest FilterIntersectionWithProperties
julia> F1 = CreateCapCategory("F1 instance", IsF1, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryTwoCell);

julia> TestOp(F1)
"Method for IsF1"

julia> F1_P1 = CreateCapCategory("F1_P1 instance", IsF1_and_SatisfiesPropertyP1, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryTwoCell);

julia> TestOp(F1_P1)
"Method for IsF1 with Property P1"

julia> F2 = CreateCapCategory("F2 instance", IsF2, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryTwoCell)
F2 instance
```

## Filter Dispatch Functions

The system provides functions to find the most specific matching filter:

```jldoctest FilterIntersectionWithProperties
julia> best_filter_f1 = dispatch_filter(F1);

julia> best_filter_f1.name
"IsF1"

julia> SetSatisfiesPropertyP1(F1, true)

julia> best_filter_f1 = dispatch_filter(F1);

julia> best_filter_f1.name
"IsF1_and_SatisfiesPropertyP1"

julia> best_filter_f1_p1 = dispatch_filter(F1_P1);

julia> best_filter_f1_p1.name
"IsF1_and_SatisfiesPropertyP1"
```

## Trait-Based Dispatch

For performance-critical code, filters can be converted to compile-time traits:

```jldoctest FilterIntersectionWithProperties
julia> trait_f1 = dispatch_trait(F1)
Val{:IsF1_and_SatisfiesPropertyP1}()

julia> trait_f2 = dispatch_trait(F2)
Val{:IsF2}()

julia> trait_f1_p1 = dispatch_trait(F1_P1)
Val{:IsF1_and_SatisfiesPropertyP1}()
```

## Intersection with Regular Filters

Regular filter intersections (without properties) can also be created:

```jldoctest FilterIntersectionWithProperties
julia> @FilterIntersection(IsF1, IsF2)

julia> @FilterIntersection(IsF1, IsF2, IsF3)

julia> @InstallMethod(TestOp, [FilterIntersection(IsF1, IsF2)], obj -> "Method for IsF1_and_IsF2")

julia> @InstallMethod(TestOp, [FilterIntersection(IsF1, IsF2, IsF3)], obj -> "Method for IsF1_and_IsF2_and_IsF3")

julia> F12 = CreateCapCategory("F1_and_F2 instance", IsF1_and_IsF2, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryTwoCell)
F1_and_F2 instance

julia> TestOp(F12)
"Method for IsF1_and_IsF2"

julia> F123 = CreateCapCategory("IsF1_and_IsF2_and_IsF3 instance", IsF1_and_IsF2_and_IsF3, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryTwoCell)
IsF1_and_IsF2_and_IsF3 instance

julia> TestOp(F123)
"Method for IsF1_and_IsF2_and_IsF3"
```
