---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������ɢ_��ս����������ʧ.lua
-- ����ʱ��:	2017/4/15 21:49:49
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)

	local scene = player.GetScene()
	if not scene then
		return
	end
	--[[
	if scene.bIsArenaMap then
		player.SetTimer(8, "scripts/skill/����/����_������ɢ_��ս����������ʧ.lua", 0, 0)
	end
	--]]

	if nLeftFrame ~= 0 then
		if not player.bFightState then
			player.AddBuff(0, 99, 5506, 1)
		end
	end

	--[[
	local scene = player.GetScene()
	if not scene then
		return
	end

	if scene.bIsArenaMap then
		local playerlist = scene.GetAllPlayer()
		for i = 1, #playerlist do
			local playerOB = GetPlayer(playerlist[i])
			if playerOB and playerOB.GetBuff(10709, 0) then
				RemoteCallToClient(playerOB.dwID, "CallUIGlobalFunction", "FireUIEvent", "ON_PLAYER_HIDE", player.dwID, false)
			end
		end
	end
	]]
end

function OnTimer(player, nP1, nP2)
	--[[
	if nP1 == 0 then
		player.SetTimer(16,"scripts/skill/����/����_������ɢ_��ս����������ʧ.lua",1,0)
	end
	SyncCompetitorSkillList(player.dwID)
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com