#include <sourcemod>
const int MAX_CHAT_MESSAGE = 255;

public Plugin myinfo = 
{
	name = "Let dead say", 
	author = "zSkyRaker", 
	description = "This is a plugin dat let alive can see what dead say", 
	version = "1.0", 
	url = "https://github.com/me10zyl/nmrih_letdeadsay.git"
};

public void OnPluginStart()
{
	HookEvent("player_say", Event_PlayerChat);
}

public Action Event_PlayerChat(Event event, const char[] name, bool dontBroadcast)
{
	char client_name[MAX_NAME_LENGTH];
	int userid = event.GetInt("userid");
	int clientId = GetClientOfUserId(userid);
	char text[MAX_CHAT_MESSAGE];
	GetEventString(event, "text", text, sizeof(text));
	GetClientName(clientId, client_name, sizeof(client_name));
	//PrintToServer("%s(dead): %s", client_name, text);
	for (int i = 1; i <= MAXPLAYERS; i++)
	{
		if (IsPlayerAlive(i))
		{
			PrintToChat(i, "(死亡)%s :  %s", client_name, text);
		}
	}
	return Plugin_Continue;
}
