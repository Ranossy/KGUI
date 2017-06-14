---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/����ڻ/�����_С���������.lua
-- ����ʱ��:	2015/6/12 11:20:58
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<

function Apply(dwCharacterID, dwSkillSrcID)
	local npcSchnappi = GetNpc(dwCharacterID)
	if not npcSchnappi then
		return
	end
	local tBuff = {
		[43083] = 13974,
		[43088] = 13975,
		[43089] = 13976,
	}
	if not tBuff[npcSchnappi.dwTemplateID] then
		return
	end
	local dwPlayerID = npcSchnappi.dwOwner
	local player = GetPlayer(dwPlayerID)
	if not player then
		return
	end
	if math.sqrt(GetDistanceSq(npcSchnappi.nX, npcSchnappi.nY, npcSchnappi.nZ, player.nX, player.nY, player.nZ)) < 64 * 7 then
		npcSchnappi.CastSkill(tBuff[npcSchnappi.dwTemplateID], 1, TARGET.PLAYER, player.dwID)
	end
	player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/����ڻ/�����_С���������.lua", npcSchnappi.dwID, 0)
end

function OnTimer(player, nParam1, nParam2)
	local npc = GetNpc(nParam1)
	if not npc then
		return
	end
	local nAngle1 = 180
	local nRadius = 20 * 64
	local nX1 = math.floor(npc.nX + math.cos(math.rad(nAngle1)) * nRadius)
	local nY1 = math.floor(npc.nY + math.sin(math.rad(nAngle1)) * nRadius)
	npc.RunTo(nX1, nY1)
	npc.SetDisappearFrames(3 * GLOBAL.GAME_FPS)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com