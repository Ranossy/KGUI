function Apply(dwCharacterID)
local npc = GetNpc(dwCharacterID)
	if not npc then
	    return
	end
	
	local scene = npc.GetScene()
	local PlayerList = scene.GetAllPlayer()
	if not PlayerList then
	    return
	end
	npc.DoAction(npc.dwID, 10068)
	npc.Yell(GetEditorString(2, 8035))
    for k, v in pairs(PlayerList) do
        local player = GetPlayer(v)
        if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
            player.Die()
        end
    end	

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com