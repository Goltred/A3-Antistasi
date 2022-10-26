params ["_caller"];
private _dogtagName = "ACE_dogtag";
private _tags = 0;

{
	// Ace dogtags are generated with an increasing id, so we have to look for a starting string
	if (_dogtagName in _x) then {
		_tags = _tags + 1;
		_caller removeItem _x;
	};
} forEach items _caller;

private _total = _tags * dogtagPrice;

if (_total > 0) then {
	private _plural = if (_tags > 1) then { "s"; } else { ""; };
	[_total] call A3A_fnc_resourcesPlayer;
	["Bounties", str formatText ["You have sold %1 dog tag%3 for $%2", _tags, _total, _plural]] call A3A_fnc_customHint;
} else {
	["Bounties", "You have no dog tags to sell!"] call A3A_fnc_customHint;
};