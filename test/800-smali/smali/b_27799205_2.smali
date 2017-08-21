.class public LB27799205_2;
.super Ljava/lang/Object;

# A class with an unresolved array type should not fail hard (unless it's a primitive-type access).

.method public static run()V
.registers 1
       return-void
.end method

.method public static test([Ljava/lang/Object;[Ldo/not/resolve/K;Z)V
.registers 6
       # Make v0, v1 and v2 null. We'll use v0 as a merge of the inputs, v1 as null, and v2 as 0.
       const v0, 0
       const v1, 0
       const v2, 0

       # Conditional jump so we have a merge point.
       if-eqz v5, :LabelSelectUnresolved

:LabelSelectResolved
       move-object v0, v3
       goto :LabelMerged

:LabelSelectUnresolved
       move-object v0, v4
       goto :LabelMerged

:LabelMerged
       # At this point, v0 will be the unresolved merge.

       # Test aput: v0[v2] = v1.
       aput v1, v0, v2

       return-void

.end method
