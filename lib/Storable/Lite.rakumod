unit class Storable::Lite;

use MONKEY-SEE-NO-EVAL;

role FileStore is export {

    sub serialize($what) returns Str {
        $what.raku
    }

    sub deserialize(Str $sth){
        EVAL($sth)
    }

    sub to-file($path, $what) is export {
        given open($path, :w) {
	    .say(serialize($what));
	    .close
        }
    }

    sub from-file($path) is export {
        if $path.IO ~~ :e {
	    return deserialize(slurp $path)
        }
        else {
	    warn "Cannot read $path";
            False;
        }
    }

    method to-file($path) {
        &to-file($path, self);
    }

    method from-file($path) {
        &from-file($path);
    }

}
