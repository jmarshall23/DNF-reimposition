class IceConsole extends DukeConsole
	transient
	config;

// Begin typing a command on the console.
exec function Icetype()
{
	TypedStr="";
	GotoState( 'Typing' );
}

defaultproperties
{

}