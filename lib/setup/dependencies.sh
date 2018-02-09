echo '... Installing/updating dependencies:
'

subroutines="$ROUTINES/$ROUTINE"

for subroutine in brew dash
  do
    source "$subroutines/$subroutine.sh"
done

unset subroutine subroutines
