echo '... Installing/updating dependencies:
'

subroutines="$ROUTINES/$ROUTINE"

for subroutine in brew dash
  do
    . "$subroutines/$subroutine.sh"
done

unset subroutine subroutines
